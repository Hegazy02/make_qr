import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:make_qr/core/extentions/dialog.dart';

import '../../../../core/enums/status_enum.dart';
import '../../../generated_qr/view/generated_qr_view.dart';
import '../../view_model/create_phone_number_qr_cubit.dart';
import '../../view_model/create_phone_number_qr_state.dart';

class CreatePhoneNumberBlocListener extends StatelessWidget {
  const CreatePhoneNumberBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePhoneNumberQrCubit, CreatePhoneNumberQrState>(
      listener: (context, state) {
        if (state.status == Status.loading) {
          context.showLoading();
        } else if (state.status == Status.success) {
          context.hideLoading();
          context.pop();
          GoRouter.of(context).pushNamed(GeneratedQrView.generatedQrView,
              extra: context.read<CreatePhoneNumberQrCubit>().qrModel?.data);
        } else if (state.status == Status.error) {
          context.hideLoading();
          context.showError(state.error?.tr());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
