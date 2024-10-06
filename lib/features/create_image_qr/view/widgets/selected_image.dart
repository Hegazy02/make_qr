import 'dart:io';

import 'package:flutter/material.dart';
import 'package:make_qr/core/constants/translation.dart';
import 'package:make_qr/core/extentions/media_query_extention.dart';
import 'package:make_qr/features/create_image_qr/view/widgets/image_with_grey_container.dart';

import '../../../../core/theme/app_colors.dart';

class SelectedImage extends StatelessWidget {
  final File imageFile;
  final void Function()? onTap;
  const SelectedImage({
    super.key,
    required this.imageFile,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 60.w,
          height: 60.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.file(
              imageFile,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) =>
                  const ImageWithGreyContainer(
                      imagePath: "assets/icons/error_icon.png", text: ""),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: 14.w,
              width: 60.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(16)),
                color: appLightGrey.withOpacity(0.9),
              ),
              child: const Icon(
                Icons.edit,
                color: appGrey,
              ),
            ),
          ),
        )
      ],
    );
  }
}
