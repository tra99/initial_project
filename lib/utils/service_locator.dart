
import 'package:get_it/get_it.dart';

import '../api_service/api_service/sample_api_service.dart';


void setUpLocator() {
  GetIt getIt = GetIt.instance;
  //api
  getIt.registerLazySingleton(() => SampleApiService());
}
