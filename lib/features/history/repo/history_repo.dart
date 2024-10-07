import 'package:dartz/dartz.dart';
import 'package:make_qr/core/helpers/exception_handlers/service_exception_handler.dart';

import '../../main/model/qr_model.dart';

abstract class HistoryRepo {
  const HistoryRepo();
  Future<Either<ServiceExceptionHandler, void>> saveToCache(
      List<QrModel> qrModels);
  Future<Either<ServiceExceptionHandler, List<QrModel>>> getQrModels();
}
