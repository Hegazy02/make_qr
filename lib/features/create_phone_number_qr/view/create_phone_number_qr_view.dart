import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/core/extentions/media_query_extention.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../core/constants/translation.dart';
import '../../../core/helpers/app_regex.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../view_model/create_phone_number_qr_cubit.dart';
import 'widgets/create_phone_number_bloc_listener.dart';

class CreatePhoneNumberQrView extends StatelessWidget {
  const CreatePhoneNumberQrView({super.key});

  static const createPhoneNumberQr = '/createPhoneNumberQrView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(title: Translation.createQrLink),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: context.read<CreatePhoneNumberQrCubit>().formKey,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/pnone_number.svg',
                      width: 80.w,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: context
                          .read<CreatePhoneNumberQrCubit>()
                          .titleController,
                      hintText: Translation.addTitle.tr(),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: context
                          .read<CreatePhoneNumberQrCubit>()
                          .phoneNumberController,
                      hintText: Translation.addPhoneNumber.tr(),
                      validator: (p0) {
                        if (AppRegex.isPhoneNumberValid(p0!.trim())) {
                          return null;
                        } else {
                          return Translation.invalidPhoneNumber.tr();
                        }
                      },
                    ),
                    const SizedBox(height: 60),
                    CustomButton(
                        title: Translation.createQr,
                        onPressed: context
                            .read<CreatePhoneNumberQrCubit>()
                            .generateQr),
                    const CreatePhoneNumberBlocListener(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
