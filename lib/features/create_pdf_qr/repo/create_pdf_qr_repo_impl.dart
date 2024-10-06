import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:pdf_render/pdf_render.dart';

import '../../../core/apis/network_helper.dart';
import '../../../core/constants/translation.dart';
import '../../../core/di/get_it.dart';
import '../../../core/helpers/exception_handlers/service_exception_handler.dart';
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
}
