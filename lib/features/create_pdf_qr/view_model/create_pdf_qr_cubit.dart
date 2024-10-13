import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart' hide Image;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/core/constants/translation.dart';
import 'package:make_qr/core/di/get_it.dart';
import '../../../core/enums/qr_type.dart';
import '../../../core/enums/status_enum.dart';
import '../../../core/helpers/files_pickers.dart';
import '../../main/model/qr_model.dart';
import '../repo/create_pdf_qr_repo.dart';

part 'create_pdf_qr_state.dart';

class CreatePdfQrCubit extends Cubit<CreatePdfQrState> {
  final CreatePdfQrRepo create_pdf_qrRepo;
  CreatePdfQrCubit(this.create_pdf_qrRepo) : super(const CreatePdfQrState());
  File? selectedFile;
  Image? selectedPdfThumbnail;
  TextEditingController titleController = TextEditingController();

  String? fileUrl;
  selectFile() async {
    emit(state.copyWith(fileStatus: Status.loading));
    final File? selectedFile = await getIt<FilePickerService>().pickFile();
    if (selectedFile != null) {
      this.selectedFile = selectedFile;
      await setPdfThumbnail();
    } else if (this.selectedFile == null && !isClosed) {
      emit(state.copyWith(
          fileStatus: Status.error, error: Translation.noFileSelected));
    } else if (!isClosed) {
      emit(state.copyWith(fileStatus: Status.success));
    }
  }

  setPdfThumbnail() async {
    final result = await create_pdf_qrRepo.getPdfThumbnail(selectedFile!.path);
    result.fold(
      (error) {
        emit(state.copyWith(
            fileStatus: Status.error, error: error.errorMessage));
      },
      (data) {
        selectedPdfThumbnail = data;
        emit(state.copyWith(fileStatus: Status.success));
      },
    );
  }

  uploadFile() async {
    try {
      emit(state.copyWith(status: Status.loading));
      if (selectedFile == null) {
        emit(state.copyWith(
            status: Status.error,
            error: Translation.pressOnFileIconToSelectAnFileFirst));

        return;
      }

      final result = await create_pdf_qrRepo.uploadFile(selectedFile!);
      result.fold(
        (error) {
          emit(state.copyWith(status: Status.error, error: error.errorMessage));
        },
        (data) {
          fileUrl = data;
          log("fileUrl $fileUrl");
        },
      );
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }
  }

  Future<void> generateQr() async {
    await uploadFile();
    if (fileUrl != null) {
      final qrModel = QrModel(
        title: titleController.text.isEmpty ? null : titleController.text,
        image: "",
        data: fileUrl,
        type: QrType.pdf,
      );
      await saveQrModel(qrModel);
      emit(state.copyWith(status: Status.success));
    }
  }

  saveQrModel(QrModel qrModel) async {
    final result = await create_pdf_qrRepo.saveQrModel(qrModel);

    result.fold(
      (error) {
        emit(state.copyWith(status: Status.error, error: error.errorMessage));
      },
      (success) {},
    );
  }

  @override
  Future<void> close() {
    titleController.dispose();
    return super.close();
  }
}
