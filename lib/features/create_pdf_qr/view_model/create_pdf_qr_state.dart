part of 'create_pdf_qr_cubit.dart';

class CreatePdfQrState {
  final Status status;
  final Status fileStatus;
  final String error;
  const CreatePdfQrState({
    this.status = Status.initial,
    this.fileStatus = Status.initial,
    this.error = '',
  });

  CreatePdfQrState copyWith({
    Status? status,
    Status? fileStatus,
    String? error,
  }) {
    return CreatePdfQrState(
      status: status ?? this.status,
      fileStatus: fileStatus ?? this.fileStatus,
      error: error ?? this.error,
    );
  }
}
