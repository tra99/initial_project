import 'package:get_it/get_it.dart';

import '../api_service/sample_api_service.dart';

final SampleApiService serviceApi = GetIt.instance<SampleApiService>();

void setUpLocator() {
  GetIt getIt = GetIt.instance;
  //api
  getIt.registerLazySingleton(() => SampleApiService());

}
