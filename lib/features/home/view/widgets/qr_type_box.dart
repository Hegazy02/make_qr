import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/translation.dart';
import '../../../../core/enums/qr_type.dart';
import '../../../../core/theme/app_font_styles.dart';
import '../../../../core/widgets/border_container.dart';
import '../../../main/model/qr_model.dart';

class QrTypeBox extends StatelessWidget {
  final QrModel qrModel;
  final void Function()? onTap;
  const QrTypeBox({super.key, required this.qrModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Image.asset(
                qrModel.image,
                fit: BoxFit.fill,
                width: 50,
                height: 50,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, size: 30),
              ),
              const SizedBox(height: 5),
              Text(
                  qrModel.type == QrType.url
                      ? Translation.link.tr()
                      : qrModel.type.name.tr(),
                  style: textStyle14Bold),
            ],
          ),
        ),
      ),
    );
  }
}
