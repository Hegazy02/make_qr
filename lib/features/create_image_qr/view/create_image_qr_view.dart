import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/core/extentions/media_query_extention.dart';

import 'package:svg_flutter/svg.dart';

import '../../../core/constants/translation.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_button.dart';
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
            child: Column(children: [
              SvgPicture.asset(
                "assets/svgs/upload_image.svg",
                width: 60.w,
              ),
              const SizedBox(height: 20),
              BlocBuilder<CreateImageQrCubit, CreateImageQrState>(
                builder: (context, state) => cubit.imageFile != null
                    ? SelectedImage(
                        imageFile: cubit.imageFile!,
                        onTap: cubit.selectImage,
                      )
                    : ImageWithGreyContainer(
                        imagePath: "assets/icons/upload_image.png",
                        onTap: cubit.selectImage,
                        text: Translation.selectAnImage,
                      ),
              ),
              const SizedBox(height: 40),
              CustomButton(
                  onPressed: cubit.generateQr, title: Translation.createQr),
              const CreateImageQrBlocListener()
            ]),
          ),
        ));
  }
}
