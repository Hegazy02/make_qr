import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:make_qr/core/di/get_it.dart';

import '../../../core/apis/network_helper.dart';
import '../../../core/helpers/exception_handlers/firebase_exception_handler.dart';
import 'create_image_qr_repo.dart';

class CreateImageQrRepoImpl extends CreateImageQrRepo {
  final NetworkHelper _networkHelper;
  const CreateImageQrRepoImpl(this._networkHelper);
  @override
  Future<Either<FirebaseExceptionHandler, String>> uploadImage(
      File image) async {
    try {
      //upload image using firebase storage

      return Right("response");
    } catch (e) {
      return Left(getIt<FirebaseExceptionHandler>()
          .generateExceptionMessage(e.toString()));
    }
  }
}
