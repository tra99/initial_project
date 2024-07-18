import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class AppLoading extends StatelessWidget {
  final Color? color;
  final double verticalMargin;
  const AppLoading({Key? key, this.color, this.verticalMargin = 32})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: verticalMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitChasingDots(color: color ?? Colors.red),
          ],
        ),
      ),
    );
  }
}

class ImageLoading extends StatelessWidget {
  final BoxFit? fit;

  const ImageLoading({Key? key, this.fit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(
        'assets/images/placeholder.png',
        fit: fit,
      ),
    );
  }
}
