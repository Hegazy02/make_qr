import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../core/helpers/exception_handlers/firebase_exception_handler.dart';
import '../../../core/helpers/exception_handlers/service_exception_handler.dart';
import '../../main/model/qr_model.dart';

abstract class CreateImageQrRepo {
  const CreateImageQrRepo();
  Future<Either<FirebaseExceptionHandler, String>> uploadImage(File image);
  Future<Either<ServiceExceptionHandler, void>> saveQrModel(QrModel qrModel);
}
