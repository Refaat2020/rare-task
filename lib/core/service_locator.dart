import 'package:get_it/get_it.dart';
import 'package:rare_task/repositories/login_repo.dart';

import 'dio_services.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(()=> DioServices());
  locator.registerLazySingleton(()=> LoginRepo());
}