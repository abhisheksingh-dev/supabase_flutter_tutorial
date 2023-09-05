import 'package:flutter/material.dart';
import 'package:supabase_app_example/app.dart';
import 'package:supabase_app_example/secret/secret_keys.dart';
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
