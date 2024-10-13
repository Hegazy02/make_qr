part of 'scanner_cubit.dart';

abstract class ScannerState {
  const ScannerState();
}

class ScannerInitial extends ScannerState {
  const ScannerInitial();
}

class ScannerLoading extends ScannerState {
  const ScannerLoading();
}

class ScannerLoaded extends ScannerState {
  const ScannerLoaded();
}

class ScannerError extends ScannerState {
  final String message;
  const ScannerError(this.message);
}
