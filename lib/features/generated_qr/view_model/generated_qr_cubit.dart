import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';

part 'generated_qr_state.dart';

class GeneratedQrCubit extends Cubit<GeneratedQrState> {
  final String data;
  GeneratedQrCubit(this.data) : super(const GeneratedQrInitial());
  ScreenshotController screenshotController = ScreenshotController();

  shareQrCode() async {
    final directory = (await getTemporaryDirectory()).path;
    screenshotController.capture().then((Uint8List? image) async {
      if (image != null) {
        try {
          String fileName = DateTime.now().microsecondsSinceEpoch.toString();
          final imagePath = await File('$directory/$fileName.png').create();
          await imagePath.writeAsBytes(image);
          Share.shareXFiles([XFile(imagePath.path)]);
        } catch (error) {
          print('Error --->> $error');
        }
      }
    }).catchError((onError) {
      print('Error --->> $onError');
    });
  }
}
