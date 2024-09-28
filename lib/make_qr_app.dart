import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/get_it.dart';
import 'core/extentions/my_media_query.dart';
import 'core/theme/theming.dart';
import 'features/main/repo/main_repo.dart';
import 'features/main/view/main_view.dart';
import 'features/main/view_model/main_cubit.dart';

class MakeQrApp extends StatelessWidget {
  const MakeQrApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyMediaQuery().getMediaQuery(context);

    return MaterialApp(
      theme: Theming.lightTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: BlocProvider<MainCubit>(
          create: (context) => MainCubit(getIt<MainRepo>()),
          child: const MainView()),
    );
  }
}
