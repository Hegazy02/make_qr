import 'package:flutter/material.dart';

import 'core/theme/theming.dart';
import 'main/view/main_view.dart';

class MakeQrApp extends StatelessWidget {
  const MakeQrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theming.lightTheme,
      home: const MainView(),
    );
  }
}
