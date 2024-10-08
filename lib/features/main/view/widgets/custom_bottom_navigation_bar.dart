import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/core/extentions/media_query_extention.dart';

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
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, -1),
          ),
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              items.length,
              (index) => InkWell(
                    onTap: () {
                      if (index != items.length ~/ 2) {
                        context.read<MainCubit>().selectView(index);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: index == selectedIndex
                          ? items[index].activeIcon
                          : items[index].icon,
                    ),
                  )),
        ));
  }

  List items = [
    BottomNavigationBarItem(
      icon: Image.asset(
        'assets/icons/home_black_icon.png',
        height: 30,
        width: 30,
      ),
      activeIcon: Image.asset(
        'assets/icons/home_icon.png',
        height: 30,
        width: 30,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.qr_code_2_outlined,
        color: Colors.white,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        'assets/icons/history_black_icon.png',
        height: 20,
        width: 20,
      ),
      activeIcon: Image.asset(
        'assets/icons/history_icon.png',
        height: 20,
        width: 20,
      ),
    ),
  ];
}
