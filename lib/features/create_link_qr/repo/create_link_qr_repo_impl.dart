import 'package:dartz/dartz.dart';
import 'package:make_qr/core/di/get_it.dart';
import 'package:make_qr/core/helpers/qr_locale_storage_service.dart';

import '../../../core/apis/network_helper.dart';
import '../../../core/helpers/exception_handlers/service_exception_handler.dart';
import '../../main/model/qr_model.dart';
import 'create_link_qr_repo.dart';

class CreateLinkQrRepoImpl extends CreateLinkQrRepo {
  final NetworkHelper _networkHelper;
  const CreateLinkQrRepoImpl(this._networkHelper);
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
