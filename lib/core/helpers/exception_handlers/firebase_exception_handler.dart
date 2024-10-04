import '../../constants/firebase_error_messages.dart';
import 'exception_handler.dart';

class FirebaseExceptionHandler extends ExceptionHandler {
  String errorMessage;

  FirebaseExceptionHandler({this.errorMessage = ''}) : super();
  @override
  FirebaseExceptionHandler generateExceptionMessage(String exceptionCode) {
    final String errorMessage;
    switch (exceptionCode) {
      case FirebaseErrorMessages.invalidCredentials:
        errorMessage = FirebaseErrorMessages.invalidCredentials;
        break;
      default:
        errorMessage = FirebaseErrorMessages.unknown;
    }

    return FirebaseExceptionHandler(errorMessage: errorMessage);
  }
}
