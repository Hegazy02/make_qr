import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/core/extentions/media_query_extention.dart';

import '../../../core/di/get_it.dart';
import '../../home/view/qr_type_box.dart';
import '../../main/view/widgets/custom_bottom_navigation_bar.dart';
import '../../main/view/widgets/scanner_button.dart';
import '../../main/view_model/main_cubit.dart';
import '../repo/home_repo.dart';
import '../view_model/home_cubit.dart';
import 'custom_stack.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt<HomeRepo>()),
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return CustomStack(
          positions: [
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
          ],
          child: Column(children: [
            GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              shrinkWrap: true,
              itemCount: context.read<HomeCubit>().qrTypes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) => QrTypeBox(
                qrModel: context.read<HomeCubit>().qrTypes[index],
                onTap: () {
                  log("sssxzxs");
                },
              ),
            )
          ]),
        );
      }),
    );
  }
}
