import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/main_cubit.dart';
import 'widgets/custom_drawer.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        body: SafeArea(
            child: BlocBuilder<MainCubit, MainState>(
                builder: (context, state) => context
                    .read<MainCubit>()
                    .tabs[context.read<MainCubit>().selectedIndex])));
  }
}
