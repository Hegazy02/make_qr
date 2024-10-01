part of 'home_cubit.dart';

class HomeState {
  const HomeState(this.status);
  final Status status;
  HomeState copyWith({Status? status}) {
    return HomeState(status ?? this.status);
  }
}
