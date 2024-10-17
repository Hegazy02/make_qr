import 'package:dartz/dartz.dart';

import '../../../core/helpers/exception_handlers/service_exception_handler.dart';
import '../../main/model/qr_model.dart';

abstract class CreatePhoneNumberQrRepo {
  const CreatePhoneNumberQrRepo();
  Future<Either<ServiceExceptionHandler, void>> saveQrModel(QrModel qrModel);
}
