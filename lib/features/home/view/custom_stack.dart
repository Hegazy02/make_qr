import 'package:flutter/material.dart';
import 'package:make_qr/core/extentions/media_query_extention.dart';

import '../../../core/theme/app_colors.dart';

class CustomStack extends StatelessWidget {
  final Widget child;
  final List<Widget> positions;
  const CustomStack({super.key, required this.child, required this.positions});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [primaryColor, secondaryColor])),
      ),
      Positioned(
        bottom: 0,
        child: Container(
            height: 88.h,
            width: 100.w,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: child)),
      ),
      ...positions
    ]);
  }
}
