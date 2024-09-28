import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/di/get_it.dart';
import 'make_qr_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setupGetIt();
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      child: const MakeQrApp()));
}
