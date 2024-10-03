import 'package:get_it/get_it.dart';
import 'package:make_qr/features/home/repo/home_repo._impl.dart';
import 'package:make_qr/features/home/repo/home_repo.dart';
import 'package:make_qr/features/main/repo/main_repo.dart';
import 'package:make_qr/features/main/repo/main_repo_impl.dart';

import '../../features/create_link_qr/repo/create_link_qr_repo.dart';
import '../../features/create_link_qr/repo/create_link_qr_repo_impl.dart';
import '../apis/network_helper.dart';
import '../helpers/exception_handlers/firebase_exception_handler.dart';
import '../helpers/wifi_scanner.dart';

final getIt = GetIt.instance;
setupGetIt() {
  getIt.registerLazySingleton<FirebaseExceptionHandler>(
      () => FirebaseExceptionHandler());
  //helpers
  getIt.registerLazySingleton<NetworkHelper>(() => NetworkHelper());
  getIt.registerLazySingleton<WifiScanner>(() => WifiScanner());

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
}
