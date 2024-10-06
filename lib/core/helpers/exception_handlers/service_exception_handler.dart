import '../../constants/translation.dart';
import 'exception_handler.dart';

class ServiceExceptionHandler extends ExceptionHandler {
  String errorMessage;

  ServiceExceptionHandler({required this.errorMessage}) : super();
  @override
  ServiceExceptionHandler generateExceptionMessage(String? exceptionCode) {
    final String errorMessage;
    switch (exceptionCode) {
      case "Internal error." || null:
        errorMessage = Translation.somethingWentWrong;
        break;
      default:
        errorMessage = exceptionCode;
    }
    return ServiceExceptionHandler(errorMessage: errorMessage);
  }
}
