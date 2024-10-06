import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/core/constants/translation.dart';
import 'package:make_qr/core/enums/status_enum.dart';
import 'package:make_qr/core/extentions/media_query_extention.dart';
import 'package:make_qr/core/widgets/custom_app_bar.dart';
import 'package:make_qr/features/create_pdf_qr/view_model/create_pdf_qr_cubit.dart';
import 'package:svg_flutter/svg.dart';

import '../../../core/widgets/custom_button.dart';
import '../../create_image_qr/view/widgets/image_with_grey_container.dart';
import 'widgets/create_pdf_qr_bloc_listener.dart';
import 'widgets/selected_file.dart';

class CreatePdfQrView extends StatelessWidget {
  const CreatePdfQrView({super.key});

  static const createPdfQr = '/createPdfQrView';

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreatePdfQrCubit>();

    return Scaffold(
        appBar: customAppBar(title: Translation.createPdfQr),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              SvgPicture.asset(
                "assets/svgs/select_file.svg",
                width: 60.w,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 60.w,
                height: 60.w,
                child: BlocBuilder<CreatePdfQrCubit, CreatePdfQrState>(
                    builder: (context, state) {
                  switch (state.fileStatus) {
                    case Status.loading:
                      return const Center(child: CircularProgressIndicator());
                    case Status.success:
                      return SelectedFile(
                        fileThumbnail: cubit.selectedPdfThumbnail!,
                        onTap: cubit.selectFile,
                      );
                    case Status.error:
                      return ImageWithGreyContainer(
                        imagePath: "assets/icons/error_icon.png",
                        onTap: cubit.selectFile,
                        text: state.error,
                      );
                    default:
                      return ImageWithGreyContainer(
                        imagePath: "assets/icons/file_image.png",
                        onTap: cubit.selectFile,
                        text: Translation.selectAFile,
                      );
                  }
                }),
              ),
              const SizedBox(height: 40),
              CustomButton(
                  onPressed: cubit.generateQr, title: Translation.createQr),
              const CreatePdfQrBlocListener()
            ]),
          ),
        ));
  }
}
