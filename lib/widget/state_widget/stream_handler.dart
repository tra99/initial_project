
import 'package:flutter/material.dart';

import '../../async_subject_manager/inherit_provider.dart';

class StreamBuilderHandler<T> extends StatefulWidget {
  final Stream<T?> stream;

  ///A callback when Stream's snapshot hasData
  final Widget Function(T) ready;

  ///A widget that showing when stream's has no data
  final Widget? loading;

  ///stream initial data
  final T? initialData;

  ///On snapshot error callback
  final Widget Function(dynamic)? error;

  ///A function call when stream has an error
  final void Function(dynamic)? onError;

  ///create a StreamBuilder with less boilerplate code
  const StreamBuilderHandler({
    super.key,
    required this.stream,
    required this.ready,
    this.error,
    this.onError,
    this.loading,
    this.initialData,
  });

  @override
  State<StreamBuilderHandler<T>> createState() => _StreamBuilderHandlerState<T>();
//_StreamBuilderHandlerState<T> createState() => _StreamBuilderHandlerState<T>();
}

class _StreamBuilderHandlerState<T> extends State<StreamBuilderHandler<T>> {
  InheritProvider? inheritProvider;
  @override
  void initState() {
    if (widget.onError != null) {
      widget.stream.asBroadcastStream().listen((data) {}, onError: (err) {
        widget.onError?.call(err);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    inheritProvider = InheritProvider.of(context);
    //
    return StreamBuilder<T?>(
      stream: widget.stream,
      initialData: widget.initialData,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return widget.ready(snapshot.data as T);
        } else if (snapshot.hasError) {
          if (widget.error != null) {
            return widget.error!(snapshot.error);
          }
          return inheritProvider?.errorWidget?.call(snapshot.error, context) ??
              Center(
                child: Text(
                  snapshot.error.toString(),
                  textAlign: TextAlign.center,
                ),
              );
        } else {
          if (widget.loading != null) {
            return widget.loading!;
          }
          return inheritProvider?.loadingWidget ??
              const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}