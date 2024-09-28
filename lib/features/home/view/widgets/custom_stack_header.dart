import 'package:flutter/material.dart';
import 'package:make_qr/core/theme/app_font_styles.dart';

class CustomStackHeader extends StatelessWidget {
  final String data;
  const CustomStackHeader({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(data, style: textStyle16Bold.copyWith(color: Colors.white)),
          IconButton(
              onPressed: Scaffold.of(context).openDrawer,
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
