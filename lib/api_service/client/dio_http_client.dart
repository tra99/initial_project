import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../constant/app_cofig.dart';






class BaseHttpClient {
  static late final Dio dio;

  static Future<void> init() async {

    final BaseOptions options = BaseOptions(
      baseUrl: AppConfig.BASE_URL,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      //sendTimeout: const Duration(minutes: 1)
    );


    dio = Dio()

      ..options = options
      ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          compact: false,
          error: true,
          request: true
      ));


  }


}



////
// class V2ApiClient {
//   static late final Dio dio;
//   static void init() {
//     final BaseOptions options = BaseOptions(
//       baseUrl: AppConfig.BASE_URL,
//       connectTimeout: const Duration(minutes: 1),
//       receiveTimeout: const Duration(minutes: 1),
//     );
//
//     dio = Dio()
//       ..options = options
//       ..interceptors.add(PrettyDioLogger(
//         requestHeader: true,
//         requestBody: true,
//         responseBody: true,
//         responseHeader: false,
//         compact: false,
//         error: true,
//       ));
//   }
// }

const JsonDecoder decoder = JsonDecoder();
const JsonEncoder encoder = JsonEncoder.withIndent('  ');



