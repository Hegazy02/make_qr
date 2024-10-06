import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/create_image_qr/repo/create_image_qr_repo_impl.dart';
import '../../features/create_image_qr/view/create_image_qr_view.dart';
import '../../features/create_image_qr/view_model/create_image_qr_cubit.dart';
import '../../features/create_link_qr/repo/create_link_qr_repo_impl.dart';
import '../../features/create_link_qr/view/create_link_qr_view.dart';
import '../../features/create_link_qr/view_model/create_link_qr_cubit.dart';
import '../../features/create_pdf_qr/repo/create_pdf_qr_repo_impl.dart';
import '../../features/create_pdf_qr/view/create_pdf_qr_view.dart';
import '../../features/create_pdf_qr/view_model/create_pdf_qr_cubit.dart';
import '../../features/generated_qr/view/generated_qr_view.dart';
import '../../features/generated_qr/view_model/generated_qr_cubit.dart';
import '../../features/main/repo/main_repo.dart';
import '../../features/main/view/main_view.dart';
import '../../features/main/view_model/main_cubit.dart';
import '../../features/scanner/view/scanner_view.dart';
import '../../features/scanner/view/widgets/pdf_url_viewer.dart';
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
        child: const ScannerView(),
      ),
    ),
    GoRoute(
      path: PdfUrlViewer.pdf,
      name: PdfUrlViewer.pdf,
      builder: (context, state) => PdfUrlViewer(url: state.extra as String),
    ),
    GoRoute(
      path: GeneratedQrView.generatedQrView,
      name: GeneratedQrView.generatedQrView,
      builder: (context, state) => BlocProvider(
          create: (context) => GeneratedQrCubit(state.extra as String),
          child: const GeneratedQrView()),
    ),
    GoRoute(
      path: CreateLinkQrView.createLinkQr,
      name: CreateLinkQrView.createLinkQr,
      builder: (context, state) => BlocProvider(
        create: (context) => CreateLinkQrCubit(
          getIt<CreateLinkQrRepoImpl>(),
        ),
        child: const CreateLinkQrView(),
      ),
    ),
    GoRoute(
      path: CreateImageQrView.createImageQr,
      name: CreateImageQrView.createImageQr,
      builder: (context, state) => BlocProvider(
        create: (context) => CreateImageQrCubit(
          getIt<CreateImageQrRepoImpl>(),
        ),
        child: const CreateImageQrView(),
      ),
    ),
    GoRoute(
      path: CreatePdfQrView.createPdfQr,
      name: CreatePdfQrView.createPdfQr,
      builder: (context, state) => BlocProvider(
        create: (context) => CreatePdfQrCubit(
          getIt<CreatePdfQrRepoImpl>(),
        ),
        child: const CreatePdfQrView(),
      ),
    ),
  ]);
}
