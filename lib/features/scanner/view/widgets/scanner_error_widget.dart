import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:make_qr/core/constants/translation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerErrorWidget extends StatelessWidget {
  const ScannerErrorWidget({super.key, required this.error});

  final MobileScannerException error;

  @override
  Widget build(BuildContext context) {
    String errorMessage;

    switch (error.errorCode) {
      case MobileScannerErrorCode.controllerUninitialized:
        errorMessage = Translation.somethingWentWrong;
      case MobileScannerErrorCode.permissionDenied:
        errorMessage = Translation.permissionDenied;
      case MobileScannerErrorCode.unsupported:
        errorMessage = Translation.scanningIsNotSupported;
      default:
        errorMessage = Translation.somethingWentWrong;
        break;
    }

    return ColoredBox(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Icon(Icons.error, color: Colors.white),
            ),
            Text(
              errorMessage.tr(),
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              error.errorDetails?.message ?? '',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
