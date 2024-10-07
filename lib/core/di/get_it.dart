import 'package:get_it/get_it.dart';
import 'package:make_qr/features/home/repo/home_repo._impl.dart';
import 'package:make_qr/features/home/repo/home_repo.dart';
import 'package:make_qr/features/main/repo/main_repo.dart';
import 'package:make_qr/features/main/repo/main_repo_impl.dart';

import '../../features/create_image_qr/repo/create_image_qr_repo.dart';
import '../../features/create_image_qr/repo/create_image_qr_repo_impl.dart';
import '../../features/create_link_qr/repo/create_link_qr_repo.dart';
import '../../features/create_link_qr/repo/create_link_qr_repo_impl.dart';
import '../../features/create_pdf_qr/repo/create_pdf_qr_repo.dart';
import '../../features/create_pdf_qr/repo/create_pdf_qr_repo_impl.dart';
import '../../features/history/repo/history_repo.dart';
import '../../features/history/repo/history_repo_impl.dart';
import '../apis/network_helper.dart';
import '../helpers/exception_handlers/firebase_exception_handler.dart';
import '../helpers/exception_handlers/service_exception_handler.dart';
import '../helpers/files_pickers.dart';
import '../helpers/wifi_scanner.dart';

final getIt = GetIt.instance;
setupGetIt() {
  getIt.registerLazySingleton<FirebaseExceptionHandler>(
      () => FirebaseExceptionHandler());
  getIt.registerLazySingleton<ServiceExceptionHandler>(
      () => ServiceExceptionHandler(errorMessage: ''));
  //helpers
  getIt.registerLazySingleton<NetworkHelper>(() => NetworkHelper());
  getIt.registerLazySingleton<WifiScanner>(() => WifiScanner());
  getIt.registerLazySingleton<FilePickerService>(() => FilePickerService());

  // main
  getIt.registerLazySingleton<MainRepoImpl>(
      () => MainRepoImpl(getIt<NetworkHelper>()));
  getIt.registerLazySingleton<MainRepo>(() => getIt<MainRepoImpl>());
  // home
  getIt.registerLazySingleton<HomeRepoImpl>(
      () => HomeRepoImpl(getIt<NetworkHelper>()));
  getIt.registerLazySingleton<HomeRepo>(() => getIt<HomeRepoImpl>());
  // create link qr
  getIt.registerLazySingleton<CreateLinkQrRepoImpl>(
      () => CreateLinkQrRepoImpl(getIt<NetworkHelper>()));
  getIt.registerLazySingleton<CreateLinkQrRepo>(
      () => getIt<CreateLinkQrRepoImpl>());
  // create image qr
  getIt.registerLazySingleton<CreateImageQrRepoImpl>(
      () => CreateImageQrRepoImpl(getIt<NetworkHelper>()));
  getIt.registerLazySingleton<CreateImageQrRepo>(
      () => getIt<CreateImageQrRepoImpl>());
  // create pdf qr
  getIt.registerLazySingleton<CreatePdfQrRepoImpl>(
      () => CreatePdfQrRepoImpl(getIt<NetworkHelper>()));
  getIt.registerLazySingleton<CreatePdfQrRepo>(
      () => getIt<CreatePdfQrRepoImpl>());
  // History
  getIt.registerLazySingleton<HistoryRepoImpl>(
      () => HistoryRepoImpl(getIt<NetworkHelper>()));
  getIt.registerLazySingleton<HistoryRepo>(() => getIt<HistoryRepoImpl>());
}
