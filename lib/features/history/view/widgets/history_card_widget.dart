import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:make_qr/core/extentions/media_query_extention.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../core/constants/translation.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font_styles.dart';
import '../../../../core/widgets/border_container.dart';
import '../../../generated_qr/view/generated_qr_view.dart';
import '../../../main/model/qr_model.dart';

class HistoryCardWidget extends StatelessWidget {
  final QrModel qrModel;
  final void Function()? onPressedDelete;

  const HistoryCardWidget(
      {super.key, required this.qrModel, this.onPressedDelete});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .pushNamed(GeneratedQrView.generatedQrView, extra: qrModel.data);
      },
      child: BorderContainer(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: PrettyQrView.data(
                        data: qrModel.data ?? '',
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error, size: 30)),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 50.w,
                        child: Text(
                          qrModel.title ?? Translation.noTitle.tr(),
                          style: textStyle14Bold,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        qrModel.type.name.tr(),
                        style: textStyle12Grey,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: onPressedDelete,
                icon: const Icon(Icons.delete),
                color: appGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
