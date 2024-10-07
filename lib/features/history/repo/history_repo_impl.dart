import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:make_qr/core/constants/translation.dart';

import '../../../core/apis/network_helper.dart';
import '../../../core/constants/const_strings.dart';
import '../../../core/di/get_it.dart';
import '../../../core/helpers/exception_handlers/service_exception_handler.dart';
import '../../../core/helpers/locale_storage.dart';
import '../../main/model/qr_model.dart';
import 'history_repo.dart';
import 'dart:convert';

class HistoryRepoImpl extends HistoryRepo {
  final NetworkHelper _networkHelper;
  const HistoryRepoImpl(this._networkHelper);
  @override
  Future<Either<ServiceExceptionHandler, List<QrModel>>> getQrModels() async {
    try {
      final String? json = await LocaleStorage.get(ConstStrings.qrModels);

      if (json == null) {
        return const Right([]);
      }
      final List<QrModel> qrModels =
          List<QrModel>.from(jsonDecode(json).map((e) => QrModel.fromMap(e)));
      return Right(qrModels);
    } catch (e) {
      log("getQrModels error : $e");
      return Left(getIt<ServiceExceptionHandler>()
          .generateExceptionMessage(e.toString()));
    }
  }

  @override
  Future<Either<ServiceExceptionHandler, void>> saveToCache(
      List<QrModel> qrModels) async {
    try {
      final String json = jsonEncode(qrModels.map((e) => e.toMap()).toList());
      await LocaleStorage.set(ConstStrings.qrModels, json);
      return const Right(null);
    } catch (e) {
      log("saveToCache error : $e");
      return Left(getIt<ServiceExceptionHandler>()
          .generateExceptionMessage(e.toString()));
    }
  }
}
