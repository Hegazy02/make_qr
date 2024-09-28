import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/core/extentions/media_query_extention.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../main/view/widgets/custom_bottom_navigation_bar.dart';
import '../../../main/view/widgets/scanner_button.dart';
import '../../../main/view_model/main_cubit.dart';

class CustomStack extends StatelessWidget {
  final Widget? header;
  final Widget child;
  const CustomStack({super.key, required this.child, required this.header});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Container(
            height: 20.h,
            width: 100.w,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: Directionality.of(context) == TextDirection.ltr
                        ? [primaryColor, secondaryColor]
                        : [secondaryColor, primaryColor])),
          ),
          SizedBox(
            height: 70.h,
          )
        ],
      ),
      if (header != null) header!,
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
      Positioned(
        bottom: 0,
        child: CustomBottomNavigationBar(
          selectedIndex: context.read<MainCubit>().selectedIndex,
        ),
      ),
      Positioned(
        bottom: 20,
        right: 50.w - 30.sp,
        child: ScannerButton(onPressed: () {}),
      ),
    ]);
  }
}
