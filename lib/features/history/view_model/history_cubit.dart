import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_qr/core/enums/status_enum.dart';
import '../../main/model/qr_model.dart';
import '../repo/history_repo.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final HistoryRepo historyRepo;
  HistoryCubit(this.historyRepo) : super(const HistoryState());
  List<QrModel> savedQrModels = [];
  getQrModels() async {
    emit(state.copyWith(status: Status.loading));
    final result = await historyRepo.getQrModels();
    result.fold(
      (error) =>
          emit(state.copyWith(status: Status.error, error: error.errorMessage)),
      (data) {
        savedQrModels = data;
        log("savedQrModels ${savedQrModels.length}");
        emit(state.copyWith(status: Status.success));
      },
    );
  }

  deleteQr(QrModel qrModel) {
    savedQrModels.remove(qrModel);
    saveToCache();
  }

  saveToCache() async {
    final result = await historyRepo.saveToCache(savedQrModels);
    result.fold(
      (error) =>
          emit(state.copyWith(status: Status.error, error: error.errorMessage)),
      (succes) => emit(state.copyWith(status: Status.success)),
    );
  }
}
