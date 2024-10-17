import 'package:dartz/dartz.dart';

import '../../../core/apis/network_helper.dart';
import '../../../core/di/get_it.dart';
import '../../../core/helpers/exception_handlers/service_exception_handler.dart';
import '../../../core/helpers/qr_locale_storage_service.dart';
import '../../main/model/qr_model.dart';
import 'create_phone_number_qr_repo.dart';

class CreatePhoneNumberQrRepoImpl extends CreatePhoneNumberQrRepo {
  final NetworkHelper _networkHelper;
  const CreatePhoneNumberQrRepoImpl(this._networkHelper);
  @override
  Future<Either<ServiceExceptionHandler, void>> saveQrModel(
      QrModel qrModel) async {
    try {
      await getIt<QrLocaleStorageService>().addQrModel(qrModel);
      return const Right(null);
    } catch (e) {
      return Left(getIt<ServiceExceptionHandler>()
          .generateExceptionMessage(e.toString()));
    }
  }
}
