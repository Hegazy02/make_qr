import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/core/extentions/media_query_extention.dart';

import 'package:svg_flutter/svg.dart';

import '../../../core/constants/translation.dart';
import '../../../core/enums/status_enum.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../view_model/create_image_qr_cubit.dart';
import 'widgets/create_image_qr_bloc_listener.dart';
import 'widgets/image_with_grey_container.dart';
import 'widgets/selected_image.dart';

class CreateImageQrView extends StatelessWidget {
  const CreateImageQrView({super.key});

  static const createImageQr = '/createImageQrView';

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateImageQrCubit>();
    return Scaffold(
        appBar: customAppBar(title: Translation.createImageQr),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(children: [
                SvgPicture.asset(
                  "assets/svgs/upload_image.svg",
                  width: 60.w,
                ),
                const SizedBox(height: 20),
                BlocBuilder<CreateImageQrCubit, CreateImageQrState>(
                    builder: (context, state) {
                  if (state.imageStatus == Status.loading) {
                    return SizedBox(
                        width: 60.w,
                        height: 60.w,
                        child:
                            const Center(child: CircularProgressIndicator()));
                  } else if (state.imageStatus == Status.success) {
                    return SelectedImage(
                      imageFile: cubit.imageFile!,
                      onTap: cubit.selectImage,
                    );
                  } else if (state.imageStatus == Status.error) {
                    return ImageWithGreyContainer(
                      imagePath: "assets/icons/error_icon.png",
                      onTap: cubit.selectImage,
                      text: Translation.selectAnImage,
                    );
                  } else {
                    return ImageWithGreyContainer(
                      imagePath: "assets/icons/upload_image.png",
                      onTap: cubit.selectImage,
                      text: Translation.selectAnImage,
                    );
                  }
                }),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: cubit.titleController,
                  hintText: Translation.addTitle.tr(),
                ),
                const SizedBox(height: 40),
                CustomButton(
                    onPressed: cubit.generateQr, title: Translation.createQr),
                const CreateImageQrBlocListener()
              ]),
            ),
          ),
        ));
  }
}
