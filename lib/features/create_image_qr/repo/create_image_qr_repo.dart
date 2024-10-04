import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../core/helpers/exception_handlers/firebase_exception_handler.dart';

abstract class CreateImageQrRepo {
  const CreateImageQrRepo();
  Future<Either<FirebaseExceptionHandler, String>> uploadImage(File image);
}
