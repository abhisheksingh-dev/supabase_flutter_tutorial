import 'package:flutter/material.dart';
import 'package:supabase_app_example/app.dart';
import 'package:supabase_app_example/secret/secret_keys.dart';
import 'package:supabase_app_example/utils/platform_detector.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseURL,
    anonKey: supabaseAnonKey,
  );
  runApp(AppRoot());
}

final supabase = Supabase.instance.client; //global variable
/// This is a utility to detect current device platform
///
/// Usage : Use it in a switch statement to handle appropriate ui decisions
///
/// Types :
/// * [DevicePlatform.undefined]
/// * [DevicePlatform.linux]
/// * [DevicePlatform.ios]
/// * [DevicePlatform.android]
/// * [DevicePlatform.web]
final devicePlatform = PlatformDetector.returnDeviceType();
