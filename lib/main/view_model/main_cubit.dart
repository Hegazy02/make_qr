import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/main_repo.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final MainRepo mainRepo;
  MainCubit(this.mainRepo) : super(const MainInitial());
}
