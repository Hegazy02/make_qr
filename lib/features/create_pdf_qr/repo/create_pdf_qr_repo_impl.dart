import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import '../../../core/apis/network_helper.dart';
import '../../../core/di/get_it.dart';
import '../../../core/helpers/exception_handlers/firebase_exception_handler.dart';
import '../../../core/helpers/exception_handlers/service_exception_handler.dart';
import '../../../core/helpers/qr_locale_storage_service.dart';
import '../../main/model/qr_model.dart';
import 'create_pdf_qr_repo.dart';
import 'dart:ui';

class CreatePdfQrRepoImpl extends CreatePdfQrRepo {
  final NetworkHelper _networkHelper;
  const CreatePdfQrRepoImpl(this._networkHelper);

  @override
  Future<Either<ServiceExceptionHandler, Image>> getPdfThumbnail(
      String path) async {
    try {
      PdfDocument doc = await PdfDocument.openFile(path);

      PdfPage page = await doc.getPage(1);

      PdfPageImage pageImage = await page.render();

      Image selectedPdfThumbnail = await pageImage.createImageIfNotAvailable();
      doc.dispose();
      return Right(selectedPdfThumbnail);
    } on PlatformException catch (error) {
      return Left(getIt<ServiceExceptionHandler>()
          .generateExceptionMessage(error.message));
    } catch (error) {
      return Left(getIt<ServiceExceptionHandler>()
          .generateExceptionMessage(error.toString()));
    }
  }

  @override
  Future<Either<FirebaseExceptionHandler, String>> uploadFile(File file) async {
    try {
      final fileName = basename(file.path);
      final destination = 'files/${fileName}_${const Uuid().v1()}';
      Reference ref = FirebaseStorage.instance.ref().child(destination);
      UploadTask uploadTask = ref.putFile(file);

      String fileUrl =
          await uploadTask.then((task) => task.ref.getDownloadURL());
      return Right(fileUrl);
    } catch (e) {
      log("uploadFile error : $e");
      return Left(getIt<FirebaseExceptionHandler>()
          .generateExceptionMessage(e.toString()));
    }
  }

  @override
  Future<Either<ServiceExceptionHandler, void>> saveQrModel(
      QrModel qrModel) async {
    try {
      await getIt<QrLocaleStorageService>().addQrModel(qrModel);
      return const Right(null);
    } catch (e) {
      return Left(getIt<ServiceExceptionHandler>()
          .generateExceptionMessage(e.toString()));
    }
  }
}
