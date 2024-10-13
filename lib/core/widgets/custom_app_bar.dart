import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../theme/app_font_styles.dart';

customAppBar({required String title}) {
  return AppBar(
    title: Text(
      title.tr(),
      style: textStyle14Bold,
    ),
    centerTitle: true,
  );
}
