import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:make_qr/core/constants/translation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/di/get_it.dart';
import '../../../core/helpers/wifi_scanner.dart';
import '../view/widgets/pdf_url_viewer.dart';

part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  // final ScannerRepo scannerRepo;
  ScannerCubit() : super(const ScannerInitial());

  runQrCode(Barcode qrCode, BuildContext context) async {
    log("type ${qrCode.type}");
    log("format ${qrCode.format}");
    log("contactInfo ${qrCode.contactInfo}");
    log("calendarEvent ${qrCode.calendarEvent}");
    log("displayValue ${qrCode.displayValue}");
    log("rawValue ${qrCode.rawValue}");
    emit(const ScannerLoading());
    try {
      switch (qrCode.type) {
        case BarcodeType.url:
          //check if pdf url
          if (false) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              GoRouter.of(context).pushReplacementNamed(PdfUrlViewer.pdf,
                  extra: qrCode.displayValue);
            });
          } else {
            launchURL(qrCode.displayValue!);
          }
          break;
        case BarcodeType.phone:
          launchUrlString("tel://${qrCode.displayValue!}");
          break;
        case BarcodeType.wifi:
          if (qrCode.wifi?.ssid != null && qrCode.wifi?.password != null) {
            await getIt<WifiScanner>()
                .scanForNetworks(qrCode.wifi!.ssid!, qrCode.wifi!.password!);
          }
          break;

        default:
      }
    } catch (e) {
      log("scanner error ${e.toString()}");
      emit(ScannerError(e.toString()));
    }

    log("ScannerLoaded");
    emit(const ScannerLoaded());
  }

  void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw "";
      }
    } catch (e) {
      log(e.toString());

      throw "${Translation.couldntLaunch} : $url";
    }
  }
}
