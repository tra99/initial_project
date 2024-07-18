import 'package:flutter/foundation.dart';

void httpLog([dynamic log, dynamic additional = ""]) {
  if (kDebugMode) printMe("Http Log: $log $additional");
}

void errorLog([dynamic log, dynamic additional = ""]) {
  debugPrint("Error Log: $log $additional");
}

void infoLog([dynamic log, dynamic additional = ""]) {
  if (kDebugMode) debugPrint("Info Log: $log $additional");
}

printMe(dynamic msg) {
  // if (kDebugMode) debugPrint("👉 $msg");
  if (kDebugMode) {
    debugPrint("👉 $msg");
  }
}

printBegin(dynamic msg) {
  printMe('>========================================');
  printMe('> START: $msg');
  printMe('>========================================');
}

printBody(dynamic msg) {
  printMe('=====> $msg');
}

printEnd(dynamic msg) {
  printMe('<========================================');
  printMe('< END: $msg');
  printMe('<========================================\n\n\n');
}
