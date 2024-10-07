import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:make_qr/core/extentions/dialog.dart';
import 'package:make_qr/features/create_pdf_qr/view_model/create_pdf_qr_cubit.dart';

import '../../../../core/enums/status_enum.dart';
import '../../../generated_qr/view/generated_qr_view.dart';

class CreatePdfQrBlocListener extends StatelessWidget {
  const CreatePdfQrBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePdfQrCubit, CreatePdfQrState>(
      listener: (context, state) {
        if (state.status == Status.loading) {
          context.showLoading();
        } else if (state.status == Status.success) {
          context.hideLoading();
          GoRouter.of(context).pushNamed(GeneratedQrView.generatedQrView,
              extra: context.read<CreatePdfQrCubit>().fileUrl);
        } else if (state.status == Status.error) {
          context.hideLoading();
          context.showError(state.error.tr());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
