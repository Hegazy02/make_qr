import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:make_qr/core/extentions/dialog.dart';
import 'package:make_qr/features/generated_qr/view/generated_qr_view.dart';

import '../../../../core/enums/status_enum.dart';
import '../../view_model/create_link_qr_cubit.dart';

class CreateLinkQrBlocListener extends StatelessWidget {
  const CreateLinkQrBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateLinkQrCubit, CreateLinkQrState>(
      listener: (context, state) {
        if (state.status == Status.loading) {
          context.showLoading();
        } else if (state.status == Status.success) {
          context.hideLoading();
          GoRouter.of(context).pushNamed(GeneratedQrView.generatedQrView,
              extra: context.read<CreateLinkQrCubit>().linkController.text);
        } else if (state.status == Status.error) {
          context.hideLoading();
          context.showError(state.error!);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
