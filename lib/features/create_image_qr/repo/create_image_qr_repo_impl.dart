import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

import '../../../core/apis/network_helper.dart';
import '../../../core/di/get_it.dart';
import '../../../core/helpers/exception_handlers/firebase_exception_handler.dart';
import 'create_image_qr_repo.dart';

class CreateImageQrRepoImpl extends CreateImageQrRepo {
  final NetworkHelper _networkHelper;
  const CreateImageQrRepoImpl(this._networkHelper);
  @override
  Future<Either<FirebaseExceptionHandler, String>> uploadImage(
      File image) async {
    try {
      final fileName = basename(image.path);
      final destination = 'images/$fileName';

      final ref = FirebaseStorage.instance.ref(destination);
      await ref.putFile(image);
      final imageUrl = await ref.getDownloadURL();

      return Right(imageUrl);
    } catch (e) {
      return Left(getIt<FirebaseExceptionHandler>()
          .generateExceptionMessage(e.toString()));
    }
  }
}
