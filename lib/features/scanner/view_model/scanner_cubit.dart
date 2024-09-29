import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  // final ScannerRepo scannerRepo;
  ScannerCubit() : super(const ScannerInitial());
  bool scnanned = false;

  void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      log(e.toString());
    }
  }

  runQrCode(MobileScannerController controller, Barcode qrCode) async {
    // if (!scnanned) {
    scnanned = true;
    closeQrScanner(controller);

    switch (qrCode.type) {
      case BarcodeType.url:
        log("message");
        launchURL(qrCode.displayValue!);
        break;
      default:
      // }
    }
  }

  closeQrScanner(MobileScannerController controller) {
    controller.dispose();
  }
}
