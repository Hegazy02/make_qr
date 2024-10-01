import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:make_qr/features/scanner/view/widgets/pdf_url_viewer.dart';

import '../../features/main/repo/main_repo.dart';
import '../../features/main/view/main_view.dart';
import '../../features/main/view_model/main_cubit.dart';
import '../../features/scanner/view/scanner_view.dart';
import '../../features/scanner/view_model/scanner_cubit.dart';
import '../di/get_it.dart';

class RouterHelper {
  static final router = GoRouter(routes: [
    GoRoute(
      path: MainView.main,
      name: MainView.main,
      builder: (context, state) => BlocProvider(
        create: (context) => MainCubit(getIt<MainRepo>()),
        child: const MainView(),
      ),
    ),
    GoRoute(
      path: ScannerView.scanner,
      name: ScannerView.scanner,
      builder: (context, state) => BlocProvider(
        create: (context) => ScannerCubit(),
        child: ScannerView(),
      ),
    ),
    GoRoute(
      path: PdfUrlViewer.pdf,
      name: PdfUrlViewer.pdf,
      builder: (context, state) => PdfUrlViewer(url: state.extra as String),
    ),
  ]);
}
