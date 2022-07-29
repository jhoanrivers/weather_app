
import 'package:get_it/get_it.dart';
import 'package:weather_app/network/client/iapi_client.dart';

import 'network/client/api_imp.dart';
import 'network/repository/repository.dart';


final getIt = GetIt.instance;


void setup () {
  getIt.registerLazySingleton<IApiClient>(() => ApiClient());
  getIt.registerLazySingleton<Repository>(() => Repository());
}