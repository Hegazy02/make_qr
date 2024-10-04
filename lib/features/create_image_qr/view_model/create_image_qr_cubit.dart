import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/core/constants/translation.dart';
import 'package:make_qr/core/di/get_it.dart';
import '../../../core/enums/status_enum.dart';
import '../../../core/helpers/files_pickers.dart';
import '../repo/create_image_qr_repo.dart';

part 'create_image_qr_state.dart';

class CreateImageQrCubit extends Cubit<CreateImageQrState> {
  final CreateImageQrRepo create_image_qrRepo;
  File? imageFile;
  CreateImageQrCubit(this.create_image_qrRepo)
      : super(const CreateImageQrState());
  String? imageUrl;

  selectImage() async {
    emit(state.copyWith(imageStatus: Status.loading));
    imageFile = await getIt<FilePickerService>().pickImage();
    emit(state.copyWith(imageStatus: Status.success));
  }

  uploadImage() async {
    try {
      emit(state.copyWith(status: Status.loading));
      if (imageFile == null) {
        emit(state.copyWith(
            status: Status.error,
            error: Translation.pressOnImageIconToSelectAnImageFirst));

        return;
      }

      final result = await create_image_qrRepo.uploadImage(imageFile!);
      result.fold(
        (error) {
          emit(state.copyWith(status: Status.error, error: error.errorMessage));
        },
        (data) {
          imageUrl = data;
        },
      );
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }
    emit(state.copyWith(status: Status.success));
  }

  createQr() async {
    await uploadImage();
    if (imageUrl != null) {}
  }
}
