import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/constants/translation.dart';
import 'core/extentions/my_media_query.dart';
import 'core/routes/routes.dart';
import 'core/theme/theming.dart';

class MakeQrApp extends StatelessWidget {
  const MakeQrApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyMediaQuery().getMediaQuery(context);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RouterHelper.router,
      title: Translation.appName.tr(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: Theming.lightTheme,
    );
  }
}
