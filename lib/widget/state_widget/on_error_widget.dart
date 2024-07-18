import 'dart:async';
import 'package:flutter/material.dart';

import '../../constant/color_theme.dart';
import '../../constant/text_style_and_decoration.dart';

class OnErrorWidget extends StatelessWidget {
  final dynamic errorMessage;
  final Future<void> Function()? onRefresh;
  final bool hasAppBar;

  const OnErrorWidget({
    Key? key,
    this.errorMessage,
    this.onRefresh,
    this.hasAppBar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (hasAppBar) {
      return Column(
        children: [
          AppBar(),
          Expanded(child: errorWidget()),
        ],
      );
    }
    return errorWidget();
  }

  Widget errorWidget() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Text(
              errorMessage == null
                  ? "Something error"
                  : errorMessage.toString(),
              style: kTitleStyle.apply(color:Colors.black87),
              textAlign: TextAlign.center,
            ),
          ),
          if (onRefresh != null)
            OutlinedButton.icon(
              onPressed: () {
                onRefresh?.call();
              },
              icon: const Icon(Icons.refresh),
              label: const Text("try again"),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColor.primary,
                padding:
                const EdgeInsets.symmetric(horizontal: 54, vertical: 8),
                side: BorderSide(color: AppColor.primary, width: 0.5),
              ),
            ),
        ],
      ),
    );
  }
}
