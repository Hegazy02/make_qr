part of 'history_cubit.dart';

class HistoryState {
  final Status status;
  final String? error;
  const HistoryState({this.status = Status.initial, this.error});

  HistoryState copyWith({Status? status, String? error}) {
    return HistoryState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
