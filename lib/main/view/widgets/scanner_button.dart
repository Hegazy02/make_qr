import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ScannerButton extends StatelessWidget {
  final void Function()? onPressed;
  const ScannerButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: primaryColor,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.qr_code_scanner,
            color: Colors.white,
            size: 40,
          ),
        ));
  }
}
