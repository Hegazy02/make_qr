part of 'create_image_qr_cubit.dart';

class CreateImageQrState {
  final Status status;
  final Status imageStatus;
  final String error;
  const CreateImageQrState({
    this.status = Status.initial,
    this.imageStatus = Status.initial,
    this.error = '',
  });

  CreateImageQrState copyWith({
    Status? status,
    Status? imageStatus,
    String? error,
  }) {
    return CreateImageQrState(
      status: status ?? this.status,
      imageStatus: imageStatus ?? this.imageStatus,
      error: error ?? this.error,
    );
  }
}
