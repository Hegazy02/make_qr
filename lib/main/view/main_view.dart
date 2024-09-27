import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/core/extentions/media_query_extention.dart';

import '../../core/theme/app_colors.dart';
import '../view_model/main_cubit.dart';
import 'widgets/custom_bottom_navigation_bar.dart';
import 'widgets/scanner_button.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor.withOpacity(0.6),
        body: SafeArea(
            child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) => Stack(children: [
            SizedBox(height: 100.h, width: 100.w, child: Column(children: [])),
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
          ]),
        )));
  }
}
