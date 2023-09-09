import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:supabase_app_example/const.dart';

class PlatformDetector {
  static DevicePlatform returnDeviceType() {
    var res = DevicePlatform.undefined;
    if (kIsWeb) {
      res = DevicePlatform.web;
    }
    if (Platform.isIOS) {
      res = DevicePlatform.ios;
    }
    if (Platform.isAndroid) {
      res = DevicePlatform.android;
    }
    if (Platform.isLinux) {
      res = DevicePlatform.linux;
    }
    return res;
  }
}
