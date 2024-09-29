import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/features/scanner/view_model/scanner_cubit.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../core/constants/translation.dart';

class ScannedBarcodeLabel extends StatelessWidget {
  const ScannedBarcodeLabel({
    super.key,
    required this.controller,
  });

  final MobileScannerController controller;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.barcodes,
      builder: (context, snapshot) {
        final scannedBarcodes = snapshot.data?.barcodes ?? [];
        if (scannedBarcodes.isNotEmpty) {
          context
              .read<ScannerCubit>()
              .runQrCode(controller, scannedBarcodes.first);
        }
        // if (scannedBarcodes.isEmpty) {
        return Text(
          Translation.scanSomething.tr(),
          overflow: TextOverflow.fade,
          style: const TextStyle(color: Colors.white),
        );

        // return Text(
        //   scannedBarcodes.first.type.toString() ?? 'No display value.',
        //   overflow: TextOverflow.fade,
        //   style: const TextStyle(color: Colors.white),
        // );
      },
    );
  }
}
