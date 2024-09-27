import 'package:get_it/get_it.dart';
import 'package:make_qr/main/repo/main_repo.dart';
import 'package:make_qr/main/repo/main_repo_impl.dart';

import '../apis/network_helper.dart';
import '../helpers/exception_handlers/firebase_exception_handler.dart';

final getIt = GetIt.instance;
setupGetIt() {
  getIt.registerLazySingleton<FirebaseExceptionHandler>(
      () => FirebaseExceptionHandler());
  getIt.registerLazySingleton<NetworkHelper>(() => NetworkHelper());

  // home
  getIt.registerLazySingleton<MainRepoImpl>(
      () => MainRepoImpl(getIt<NetworkHelper>()));
  getIt.registerLazySingleton<MainRepo>(() => getIt<MainRepoImpl>());
  // exception
}
