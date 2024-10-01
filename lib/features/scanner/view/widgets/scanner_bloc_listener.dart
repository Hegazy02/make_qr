import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:make_qr/core/extentions/dialog.dart';

import '../../view_model/scanner_cubit.dart';

class ScannerBlocListener extends StatelessWidget {
  const ScannerBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScannerCubit, ScannerState>(
      listener: (context, state) {
        if (state is ScannerLoading) {
          context.showLoading();
        } else if (state is ScannerLoaded) {
          context.hideLoading();
          context.pop();
        } else if (state is ScannerError) {
          context.hideLoading();
          context.showError(state.message.tr());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
