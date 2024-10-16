import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/translation.dart';
import '../../../core/di/get_it.dart';
import '../../main/model/qr_model.dart';
import 'widgets/custom_stack_header.dart';
import 'widgets/qr_type_box.dart';

import '../repo/home_repo.dart';
import '../view_model/home_cubit.dart';
import 'widgets/custom_stack.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt<HomeRepo>()),
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return CustomStack(
          header: CustomStackHeader(
            data: Translation.createQr.tr(),
          ),
          child: Stack(children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Opacity(
                    opacity: 0.3,
                    child: Image.asset("assets/images/portfolio_qr.jpg")),
              ),
            ),
            Column(children: [
              GridView.builder(
                shrinkWrap: true,
                itemCount: context.read<HomeCubit>().qrTypes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) => QrTypeBox(
                  qrModel: context.read<HomeCubit>().qrTypes[index]['qrModel']
                      as QrModel,
                  onTap: () {
                    GoRouter.of(context).pushNamed(
                      context.read<HomeCubit>().qrTypes[index]['route']
                          as String,
                    );
                  },
                ),
              )
            ]),
          ]),
        );
      }),
    );
  }
}
