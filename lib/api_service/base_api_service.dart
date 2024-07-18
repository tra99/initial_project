import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../constant/app_constant.dart';
import '../constant/app_text.dart';
import '../widget/button/general_button.dart';
import 'client/dio_http_client.dart';
import 'client/http_exception.dart';
import 'client/logger.dart';



class BaseApiService {
  static BuildContext? context;
  late Dio dio;
  BaseApiService({Dio? dio}) {
    if (dio != null) {
      this.dio = dio;
    } else {
      this.dio = BaseHttpClient.dio;
    }
  }

  final String _MESSAGE_FIELD = "message";

  Future<T> onRequest<T>({
    required String path,
    required String method,
    required T Function(Response) onSuccess,
    Map<String, dynamic>? query,
    Map<String, dynamic> headers = const {},
    dynamic data = const {},
    bool requiredToken = true,
    String? customToken,
    Dio? customDioClient,
    bool autoRefreshToken = true,
  }) async {
    late Response response;

    try {
      final httpOption = Options(method: method, headers: {});
      AppConstant.USER_TOKEN = "1395|pH5Lh4jR6uunig4rkWzMtFZEjiHkrt63oHlle1Ga8bc64604";
      // printMe("AppToken:${AppConstant.USER_TOKEN}");
      // await SharedPref.init();
      if (requiredToken && AppConstant.USER_TOKEN != null ||
          AppConstant.USER_TOKEN != "") {
        httpOption.headers!['Authorization'] =
        "Bearer ${AppConstant.USER_TOKEN}";
      }
      if (customToken != null) {
        httpOption.headers!['Authorization'] = "Bearer $customToken";
      }
      httpOption.headers!.addAll(headers);
      query ??= {};
      query["language_code"] = AppConstant.languageCode;
      if (customDioClient != null) {
        response = await customDioClient.request(
          path,
          options: httpOption,
          queryParameters: query,
          data: data,
        );
      } else {
        response = await dio.request(
          path,
          options: httpOption,
          queryParameters: query,
          data: data,
        );
      }
      if (response.data != null) {
        if (response.data['code'] == 403) {
          printMe('=======> $this error: 403');
          if (context != null) {
            await showDialog(
              context: context!,
              barrierDismissible: false,
              builder: (_) => PopScope(
                canPop: false,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.large(
                        'Your token has expired!',
                        color: Colors.black,
                      ),
                      const Divider(color: Colors.grey),
                      AppText.medium(
                        'Please log in again to get a new token!',
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 32),
                      GeneralButton(
                        onPressed: () {
                          // AuthService.logUserOut(context: context!);
                        },
                        child: AppText.medium(
                          'Log out',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        }
        return onSuccess(response);
      } else {
        throw ServerResponseException(response.data[_MESSAGE_FIELD]);
      }
    } on DioException catch (exception) {
      printMe("ServerResponseException:error1");
      // await Sentry.captureException(exception, stackTrace: stackTrace);
      throw _onDioError(exception);
    } on ServerResponseException catch (exception) {
      printMe("ServerResponseException:error");
      // await Sentry.captureException(exception, stackTrace: stackTrace);
      throw _onServerResponseException(exception, response);
    } catch (exception) {
      printMe("ServerResponseException:error2");
      // await Sentry.captureException(exception, stackTrace: stackTrace);
      throw _onTypeError(exception);
    }
  }
}

String _onTypeError(dynamic exception) {
  ///Logic or syntax error on some condition
  errorLog(
      "Type Error :=> ${exception.toString()}\nStackTrace:  ${exception.stackTrace.toString()}");
  return ErrorMessage.SOMETHING_WRONG;
}

//
DioErrorException _onDioError(DioException exception) {
  _logDioError(exception);
  if (exception.error is SocketException) {
    printMe("_onDioError2");

    ///Socket exception mostly from internet connection or host
    return DioErrorException(ErrorMessage.CONNECTION_ERROR);
  } else if (exception.type == DioExceptionType.connectionTimeout) {
    printMe("_onDioError3");

    ///Connection timeout due to internet connection or server not responding
    return DioErrorException(ErrorMessage.TIMEOUT_ERROR);
  } else if (exception.type == DioExceptionType.badResponse) {
    ///Error that range from 400-500
    String serverMessage;
    if (exception.response!.data is Map) {
      serverMessage =
          exception.response?.data["message"] ?? ErrorMessage.UNEXPECTED_ERROR;
    } else {
      serverMessage = ErrorMessage.UNEXPECTED_ERROR;
    }
    return DioErrorException(serverMessage,
        code: exception.response!.statusCode);
  }
  throw DioErrorException(ErrorMessage.UNEXPECTED_ERROR);
}

ServerResponseException _onServerResponseException(
    dynamic exception, Response response) {
  printMe(
      "Http Log: Server error :=> ${response.requestOptions.path}:=> $exception");
  //httpLog("Server error :=> ${response.requestOptions.path}:=> $exception");
  return ServerResponseException(exception.toString());
}

void _logDioError(DioException exception) {
  String errorMessage = "Dio error :=> ${exception.requestOptions.path}";
  if (exception.response != null) {
    errorMessage += ", Response: => ${exception.response!.data.toString()}";
  } else {
    errorMessage += ", ${exception.message}";
  }

  printMe("Http Log: Server error :=> $errorMessage");
}

String handleExceptionError(dynamic error, [String path = ""]) {
  printMe(
      "Exception caught [${error.runtimeType}][$path]: ${error.toString()}");
  String errorMessage = ErrorMessage.UNEXPECTED_ERROR;
  //Dio Error
  if (error is DioException) {
    if (error.error is SocketException) {
      errorMessage = ErrorMessage.CONNECTION_ERROR;
    } else if (error.type == DioExceptionType.connectionTimeout) {
      errorMessage = ErrorMessage.TIMEOUT_ERROR;
    } else if (error.type == DioExceptionType.badResponse) {
      printMe("Dio Response error on: ${error.requestOptions.path}");
      if (error.response!.statusCode == 502) {
        errorMessage =
        "${error.response!.statusCode}: ${ErrorMessage.SERVER_ERROR}";
      } else {
        errorMessage =
        "${error.response!.statusCode}: ${ErrorMessage.UNEXPECTED_ERROR}";
      }
    }
    return errorMessage;
    //Json convert error
  } else if (error is TypeError) {
    printMe(error.stackTrace.toString());
    return errorMessage;
    //Error message from server
  } else if (error is ArgumentError) {
    throw errorMessage;
  } else {
    return error.toString();
  }
}
