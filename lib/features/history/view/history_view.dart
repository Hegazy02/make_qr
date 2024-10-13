import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/translation.dart';
import '../../../core/di/get_it.dart';
import '../../../core/enums/status_enum.dart';
import '../../../core/theme/app_font_styles.dart';
import '../../home/view/widgets/custom_stack.dart';
import '../../home/view/widgets/custom_stack_header.dart';
import '../../main/view/widgets/custom_drawer.dart';
import '../repo/history_repo.dart';
import '../view_model/history_cubit.dart';
import 'widgets/history_card_widget.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  static const history = '/historyView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        body: SafeArea(
          child: BlocProvider(
            create: (context) =>
                HistoryCubit(getIt<HistoryRepo>())..getQrModels(),
            child: BlocBuilder<HistoryCubit, HistoryState>(
                builder: (context, state) {
              final cubit = context.read<HistoryCubit>();
              return CustomStack(
                header: CustomStackHeader(
                  data: Translation.history.tr(),
                ),
                child: state.status == Status.loading
                    ? Center(
                        child: Text(Translation.downloading.tr(),
                            style: textStyle14Bold))
                    : cubit.savedQrModels.isEmpty
                        ? Center(
                            child: Text(Translation.noHistory.tr(),
                                style: textStyle14Bold))
                        : ListView.separated(
                            itemBuilder: (context, index) => HistoryCardWidget(
                                  qrModel: cubit.savedQrModels[index],
                                  onPressedDelete: () {
                                    cubit.deleteQr(cubit.savedQrModels[index]);
                                  },
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemCount: cubit.savedQrModels.length),
              );
            }),
          ),
        ));
  }
}
