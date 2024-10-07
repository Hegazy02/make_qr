import 'dart:convert';
import 'dart:developer';

import '../../features/main/model/qr_model.dart';
import '../constants/const_strings.dart';
import 'locale_storage.dart';

class QrLocaleStorageService {
  Future<List<QrModel>> getQrModels() async {
    try {
      final String? json = await LocaleStorage.get(ConstStrings.qrModels);

      if (json == null) {
        return [];
      }
      final List<QrModel> qrModels =
          List<QrModel>.from(jsonDecode(json).map((e) => QrModel.fromMap(e)));
      return qrModels;
    } catch (e) {
      log("getQrModels error : $e");
      rethrow;
    }
  }

  Future<void> saveToCache(List<QrModel> qrModels) async {
    try {
      final String json = jsonEncode(qrModels.map((e) => e.toMap()).toList());
      await LocaleStorage.set(ConstStrings.qrModels, json);
    } catch (e) {
      log("saveToCache error : $e");
      rethrow;
    }
  }

  Future<void> addQrModel(QrModel qrModel) async {
    try {
      final List<QrModel> qrModels = await getQrModels();
      qrModels.insert(0, qrModel);

      await saveToCache(qrModels);
    } catch (e) {
      log("addQrModel error : $e");
      rethrow;
    }
  }
}
