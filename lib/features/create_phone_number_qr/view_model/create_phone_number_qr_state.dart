import '../../../core/enums/status_enum.dart';

class CreatePhoneNumberQrState {
  Status status;
  String? error;
  CreatePhoneNumberQrState({this.status = Status.initial, this.error});

  CreatePhoneNumberQrState copyWith(
      {Status? status, Status? imageStatus, String? error}) {
    return CreatePhoneNumberQrState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
