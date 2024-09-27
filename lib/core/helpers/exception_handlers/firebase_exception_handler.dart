import '../../constants/firebase_error_messages.dart';
import 'exception_handler.dart';

class FirebaseExceptionHandler extends ExceptionHandler {
  @override
  String generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case FirebaseErrorMessages.invalidCredentials:
        errorMessage = FirebaseErrorMessages.invalidCredentials;
        break;
      default:
        errorMessage = FirebaseErrorMessages.unknown;
    }

    return errorMessage;
  }
}
