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
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: const DecorationImage(
                  image: AssetImage("assets/icons/logo.png"),
                )),
          ),
          const SizedBox(width: 5),
          Text(data, style: textStyle18Bold.copyWith(color: Colors.white)),
          const Spacer(),
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
