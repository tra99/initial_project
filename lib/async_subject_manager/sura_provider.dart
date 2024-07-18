import 'package:flutter/material.dart';
import 'package:initial/async_subject_manager/subject_manager.dart';



class SuraProvider extends InheritedWidget {
  const SuraProvider({
    super.key,
    required super.child,
    this.loadingWidget,
    this.errorWidget,
    this.buttonLoadingWidget,
    this.ellipsisText = "",
  });

  ///Loading widget use in [SuraAsyncButton,SuraAsyncIconButton and SuraRaisedButton]
  final Widget? buttonLoadingWidget;

  ///Loading widget use in [SuraFutureHandler,SuraStreamHandler] class
  final Widget? loadingWidget;

  ///Error widget use in [SuraFutureHandler,SuraStreamHandler] class
  final CustomErrorWidget? errorWidget;

  ///A text to replace when EllipsisText's string is null
  final String ellipsisText;

  static SuraProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SuraProvider>();
  }

  @override
  bool updateShouldNotify(SuraProvider oldWidget) => true;
}