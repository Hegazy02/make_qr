import 'dart:ui';

import 'package:flutter/material.dart' hide Image;
import 'package:make_qr/core/extentions/media_query_extention.dart';

import '../../../../core/theme/app_colors.dart';

class SelectedFile extends StatelessWidget {
  final Image fileThumbnail;
  final void Function()? onTap;
  const SelectedFile({
    super.key,
    required this.fileThumbnail,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RawImage(
            image: fileThumbnail,
            width: 60.w,
            height: 60.w,
            fit: BoxFit.contain),
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
