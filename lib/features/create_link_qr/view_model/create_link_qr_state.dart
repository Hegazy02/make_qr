part of 'create_link_qr_cubit.dart';

class CreateLinkQrState {
  Status status;
  Status imageStatus;
  String? error;
  CreateLinkQrState(
      {this.status = Status.initial,
      this.imageStatus = Status.initial,
      this.error});

  CreateLinkQrState copyWith(
      {Status? status, Status? imageStatus, String? error}) {
    return CreateLinkQrState(
      status: status ?? this.status,
      imageStatus: imageStatus ?? this.imageStatus,
      error: error ?? this.error,
    );
  }
}
