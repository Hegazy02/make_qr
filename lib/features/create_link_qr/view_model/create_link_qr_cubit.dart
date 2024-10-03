import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:make_qr/core/enums/status_enum.dart';
import '../repo/create_link_qr_repo.dart';

part 'create_link_qr_state.dart';

class CreateLinkQrCubit extends Cubit<CreateLinkQrState> {
  final CreateLinkQrRepo create_link_qrRepo;
  CreateLinkQrCubit(this.create_link_qrRepo) : super(CreateLinkQrState());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController linkController = TextEditingController();
  generateQr(BuildContext context) {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(status: Status.loading));
      // GoRouter.of(context).pushNamed(QrView.qrView, extra: linkController.text);
      linkController.clear();
      emit(state.copyWith(status: Status.success));
    }
  }

  @override
  Future<void> close() {
    linkController.dispose();
    return super.close();
  }
}
