import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/core/extentions/media_query_extention.dart';

import 'package:svg_flutter/svg.dart';

import '../../../core/constants/translation.dart';
import '../../../core/helpers/app_regex.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../view_model/create_link_qr_cubit.dart';
import 'widgets/create_link_qr_bloc_listener.dart';

class CreateLinkQrView extends StatelessWidget {
  const CreateLinkQrView({
    super.key,
  });

  static const createLinkQr = '/createLinkQrView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(title: Translation.createQrLink),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: context.read<CreateLinkQrCubit>().formKey,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/link.svg',
                      width: 60.w,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller:
                          context.read<CreateLinkQrCubit>().titleController,
                      hintText: Translation.addTitle.tr(),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller:
                          context.read<CreateLinkQrCubit>().linkController,
                      hintText: Translation.addLink.tr(),
                      validator: (p0) {
                        if (AppRegex.isUrlValid(p0!)) {
                          return null;
                        } else {
                          return Translation.invalidLink.tr();
                        }
                      },
                    ),
                    const SizedBox(height: 60),
                    CustomButton(
                      title: Translation.createQr,
                      onPressed: () {
                        context.read<CreateLinkQrCubit>().generateQr(context);
                      },
                    ),
                    const CreateLinkQrBlocListener(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
