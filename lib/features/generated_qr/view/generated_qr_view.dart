import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:make_qr/core/constants/translation.dart';
import 'package:make_qr/core/extentions/media_query_extention.dart';
import 'package:make_qr/features/generated_qr/view_model/generated_qr_cubit.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:svg_flutter/svg.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../main/view/main_view.dart';

class GeneratedQrView extends StatelessWidget {
  const GeneratedQrView({super.key});

  static const generatedQrView = '/generatedQrView';

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GeneratedQrCubit>();
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: cubit.shareQrCode, icon: const Icon(Icons.share))
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Text(
                    //   Translation.great.tr(),
                    //   style: textStyle16Bold,
                    // ),
                    // const SizedBox(height: 10),
                    SvgPicture.asset(
                      "assets/svgs/success.svg",
                      width: 60.w,
                    ),
                    Screenshot(
                        controller: cubit.screenshotController,
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(20),
                          child: PrettyQrView.data(
                            data: cubit.data,
                          ),
                        )),
                    const SizedBox(height: 20),
                    CustomButton(
                      title: Translation.backToHome.tr(),
                      onPressed: () {
                        GoRouter.of(context).go(MainView.main);
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
