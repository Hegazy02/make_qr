import 'package:dartz/dartz.dart';
import 'package:make_qr/core/helpers/qr_locale_storage_service.dart';
import '../../../core/apis/network_helper.dart';
import '../../../core/di/get_it.dart';
import '../../../core/helpers/exception_handlers/service_exception_handler.dart';
import '../../main/model/qr_model.dart';
import 'history_repo.dart';

class HistoryRepoImpl extends HistoryRepo {
  final NetworkHelper _networkHelper;
  const HistoryRepoImpl(this._networkHelper);
  @override
  Future<Either<ServiceExceptionHandler, List<QrModel>>> getQrModels() async {
    try {
      final List<QrModel> qrModels =
          await getIt<QrLocaleStorageService>().getQrModels();
      return Right(qrModels);
    } catch (e) {
      return Left(getIt<ServiceExceptionHandler>()
          .generateExceptionMessage(e.toString()));
    }
  }

  @override
  Future<Either<ServiceExceptionHandler, void>> saveToCache(
      List<QrModel> qrModels) async {
    try {
      await getIt<QrLocaleStorageService>().saveToCache(qrModels);
      return const Right(null);
    } catch (e) {
      return Left(getIt<ServiceExceptionHandler>()
          .generateExceptionMessage(e.toString()));
    }
  }
}
