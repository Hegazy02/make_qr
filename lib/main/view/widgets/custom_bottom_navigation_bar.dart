import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/core/extentions/media_query_extention.dart';

import '../../../core/theme/app_colors.dart';
import '../../view_model/main_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  CustomBottomNavigationBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 100.w,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              items.length,
              (index) => InkWell(
                    onTap: () {
                      context.read<MainCubit>().selectView(index);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: index == selectedIndex
                          ? items[index].activeIcon
                          : items[index].icon,
                    ),
                  )),
        ));
  }

  List items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      activeIcon: Icon(
        Icons.home,
        size: 30,
        color: primaryColor,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.qr_code_2_outlined,
        color: Colors.white,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.history,
      ),
      activeIcon: Icon(
        Icons.history,
        color: primaryColor,
        size: 30,
      ),
    ),
  ];
}
