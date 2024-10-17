import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/enums/qr_type.dart';
import '../../../core/enums/status_enum.dart';
import '../../main/model/qr_model.dart';
import '../repo/create_phone_number_qr_repo.dart';
import 'create_phone_number_qr_state.dart';

class CreatePhoneNumberQrCubit extends Cubit<CreatePhoneNumberQrState> {
  final CreatePhoneNumberQrRepo createPhoneNumberQrRepo;
  CreatePhoneNumberQrCubit(this.createPhoneNumberQrRepo)
      : super(CreatePhoneNumberQrState());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  QrModel? qrModel;

  generateQr() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(status: Status.loading));
      qrModel = QrModel(
          type: QrType.phoneNumber,
          image: "",
          data: "tel:${phoneNumberController.text.trim()}",
          title: titleController.text.isEmpty ? null : titleController.text);
      await saveQrModel(qrModel!);
      clearControllers();

      emit(state.copyWith(status: Status.success));
    }
  }

  clearControllers() {
    phoneNumberController.clear();
    titleController.clear();
  }

  saveQrModel(QrModel qrModel) async {
    final result = await createPhoneNumberQrRepo.saveQrModel(qrModel);

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
    phoneNumberController.dispose();
    return super.close();
  }
}
