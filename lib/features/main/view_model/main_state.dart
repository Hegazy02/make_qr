part of 'main_cubit.dart';

class MainState {
  const MainState(this.status);
  final Status status;
  MainState copyWith({Status? status}) {
    return MainState(status ?? this.status);
  }
}
