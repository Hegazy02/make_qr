import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/core/constants/translation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../view_model/scanner_cubit.dart';
import 'widgets/scanned_barcode_label.dart';
import 'widgets/scanner_bloc_listener.dart';
import 'widgets/scanner_button_widgets.dart';
import 'widgets/scanner_error_widget.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({super.key});
  static const scanner = "/scannerView";

  @override
  _ScannerViewState createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  final MobileScannerController controller = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
  );

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(Offset.zero),
      width: 200,
      height: 200,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(Translation.scan.tr()),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: MobileScanner(
                    fit: BoxFit.contain,
                    controller: controller,
                    scanWindow: scanWindow,
                    errorBuilder: (context, error, child) {
                      return ScannerErrorWidget(error: error);
                    },
                    overlayBuilder: (context, constraints) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ScannedBarcodeLabel(controller: controller),
                        ),
                      );
                    },
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: controller,
                  builder: (context, value, child) {
                    if (!value.isInitialized ||
                        !value.isRunning ||
                        value.error != null) {
                      return const SizedBox();
                    }

                    return CustomPaint(
                      painter: ScannerOverlay(scanWindow: scanWindow),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ToggleFlashlightButton(controller: controller),
                        SwitchCameraButton(controller: controller),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: IconButton(
                        onPressed: () async {
                          final Barcode? result = await context
                              .read<ScannerCubit>()
                              .scanImage(controller);
                          if (result != null) {
                            await context
                                .read<ScannerCubit>()
                                .scanQrCode(result, context);
                          }
                        },
                        icon: const Icon(Icons.image_rounded,
                            size: 34, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          const ScannerBlocListener(),
        ],
      ),
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await controller.dispose();
  }
}

class ScannerOverlay extends CustomPainter {
  const ScannerOverlay({
    required this.scanWindow,
    this.borderRadius = 12.0,
  });

  final Rect scanWindow;
  final double borderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPath = Path()..addRect(Rect.largest);

    final cutoutPath = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          scanWindow,
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      );

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final borderRect = RRect.fromRectAndCorners(
      scanWindow,
      topLeft: Radius.circular(borderRadius),
      topRight: Radius.circular(borderRadius),
      bottomLeft: Radius.circular(borderRadius),
      bottomRight: Radius.circular(borderRadius),
    );

    // First, draw the background,
    // with a cutout area that is a bit larger than the scan window.
    // Finally, draw the scan window itself.
    canvas.drawPath(backgroundWithCutout, backgroundPaint);
    canvas.drawRRect(borderRect, borderPaint);
  }

  @override
  bool shouldRepaint(ScannerOverlay oldDelegate) {
    return scanWindow != oldDelegate.scanWindow ||
        borderRadius != oldDelegate.borderRadius;
  }
}
