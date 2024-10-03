import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../theme/app_font_styles.dart';
import 'border_container.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title.tr(),
              style: textStyle14Bold.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
