import 'package:flutter/material.dart';
import 'package:initial/widget/state_widget/stream_handler.dart';
import '../../api_service/client/http_exception.dart';
import '../loading/app_loading.dart';
import 'on_error_widget.dart';


class BaseStreamBuilder<T> extends StatelessWidget {
  final Widget Function(T) ready;
  final Widget Function(dynamic)? error;
  final Widget? loading;
  final Stream<T?> stream;
  final Future<void> Function()? onRefresh;
  final bool hasAppBarOnError;

  const BaseStreamBuilder({
    super.key,
    required this.stream,
    required this.ready,
    this.loading,
    this.onRefresh,
    this.hasAppBarOnError = false,
    this.error,
  });
  @override
  Widget build(BuildContext context) {
    return StreamBuilderHandler<T>(
      stream: stream,
      loading: loading ?? const AppLoading(),
      onError: (dynamic error) async {
        if (error is DioErrorException) {
          if (error.code == 401) {
            // AuthService.logOutUser(context);
          }
        }
      },
      error: (exception) {
        if (error != null) {
          return error!(exception);
        }
        return OnErrorWidget(
          errorMessage: error.toString(),
          onRefresh: onRefresh,
          hasAppBar: hasAppBarOnError,
        );
      },
      ready: ready,
    );
  }
}
