import 'dart:io';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/core/constants/translation.dart';
import 'package:make_qr/core/di/get_it.dart';
import '../../../core/enums/status_enum.dart';
import '../../../core/helpers/files_pickers.dart';
import '../repo/create_pdf_qr_repo.dart';

part 'create_pdf_qr_state.dart';

class CreatePdfQrCubit extends Cubit<CreatePdfQrState> {
  final CreatePdfQrRepo create_pdf_qrRepo;
  CreatePdfQrCubit(this.create_pdf_qrRepo) : super(const CreatePdfQrState());
  File? selectedFile;
  Image? selectedPdfThumbnail;

  String? fileUrl;
  selectFile() async {
    emit(state.copyWith(fileStatus: Status.loading));
    final File? selectedFile = await getIt<FilePickerService>().pickFile();
    if (selectedFile != null) {
      this.selectedFile = selectedFile;
    }
    await setPdfThumbnail();
  }

  setPdfThumbnail() async {
    if (selectedFile != null) {
      final result =
          await create_pdf_qrRepo.getPdfThumbnail(selectedFile!.path);
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
    } else {
      emit(state.copyWith(
          fileStatus: Status.error, error: Translation.noFileSelected));
    }
  }

  Future<void> generateQr() async {}
}
