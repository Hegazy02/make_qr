import 'package:flutter/material.dart';
import 'package:make_qr/core/theme/app_colors.dart';

class BorderContainer extends StatelessWidget {
  final Widget child;
  const BorderContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [primaryColor, secondaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 4),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: child,
      ),
    );
  }
}
