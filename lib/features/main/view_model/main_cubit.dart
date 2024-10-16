import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/enums/status_enum.dart';
import '../../history/view/history_view.dart';
import '../../home/view/home_view.dart';
import '../repo/main_repo.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final MainRepo mainRepo;
  MainCubit(this.mainRepo) : super(const MainState(Status.initial));
  List<Widget> tabs = [
    const HomeView(),
    const HomeView(),
    const HistoryView(),
  ];

  int selectedIndex = 0;
  selectView(int index) {
    selectedIndex = index;
    emit(state.copyWith(status: Status.initial));
  }
}
