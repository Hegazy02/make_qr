import 'dart:ui';

import 'package:dartz/dartz.dart';

import '../../../core/helpers/exception_handlers/service_exception_handler.dart';

abstract class CreatePdfQrRepo {
  const CreatePdfQrRepo();
  Future<Either<ServiceExceptionHandler, Image>> getPdfThumbnail(String path);
}
