import 'dart:io';

import 'package:flutter/material.dart';
import 'package:make_qr/core/extentions/media_query_extention.dart';

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
        Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image:
                DecorationImage(image: FileImage(imageFile), fit: BoxFit.fill),
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
