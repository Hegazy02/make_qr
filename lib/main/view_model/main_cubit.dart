import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/core/enums/status.enum.dart';
import '../repo/main_repo.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final MainRepo mainRepo;
  MainCubit(this.mainRepo) : super(const MainState(Status.initial));
  int selectedIndex = 0;
  selectView(int index) {
    selectedIndex = index;
    emit(state.copyWith(status: Status.initial));
  }
}
