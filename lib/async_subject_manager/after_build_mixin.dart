import 'package:flutter/material.dart';

///Create an override method that call after build method has been called
mixin AfterBuildMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      afterBuild(context);
    });
    super.initState();
  }

  ///this method will run after build method has been called
  void afterBuild(BuildContext context);
}

///Create a bool type [ValueNotifier] to indicate or define loading state
mixin BoolNotifierMixin<T extends StatefulWidget> on State<T> {
  late ValueNotifier<bool> boolNotifier;

  void toggleValue([bool? value]) {
    boolNotifier.value = value ?? !boolNotifier.value;
  }

  @override
  void initState() {
    boolNotifier = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    boolNotifier.dispose();
    super.dispose();
  }
}