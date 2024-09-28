import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class ScannerButton extends StatelessWidget {
  final void Function()? onPressed;
  const ScannerButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, -1),
            ),
          ],
          gradient: LinearGradient(
            colors: [primaryColor, secondaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
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
