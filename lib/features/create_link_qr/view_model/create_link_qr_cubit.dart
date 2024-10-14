import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/core/enums/status_enum.dart';
import '../../../core/enums/qr_type.dart';
import '../../main/model/qr_model.dart';
import '../repo/create_link_qr_repo.dart';

part 'create_link_qr_state.dart';

class CreateLinkQrCubit extends Cubit<CreateLinkQrState> {
  final CreateLinkQrRepo create_link_qrRepo;
  CreateLinkQrCubit(this.create_link_qrRepo) : super(CreateLinkQrState());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController linkController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  QrModel? qrModel;
  generateQr(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(status: Status.loading));
      qrModel = QrModel(
          type: QrType.url,
          image: "",
          data: linkController.text,
          title: titleController.text.isEmpty ? null : titleController.text);
      await saveQrModel(qrModel!);
      clearControllers();

      emit(state.copyWith(status: Status.success));
    }
  }

  clearControllers() {
    linkController.clear();
    titleController.clear();
  }

  saveQrModel(QrModel qrModel) async {
    final result = await create_link_qrRepo.saveQrModel(qrModel);

    result.fold(
      (error) {
        emit(state.copyWith(status: Status.error, error: error.errorMessage));
      },
      (success) {},
    );
  }

  @override
  Future<void> close() {
    linkController.dispose();
    titleController.dispose();
    return super.close();
  }
}
