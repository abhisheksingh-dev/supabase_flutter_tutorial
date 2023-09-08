import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_app_example/provider/login_provider.dart';

import 'screens/home/home.dart';

class AppRoot extends StatelessWidget {
  AppRoot({super.key});
  final LoginProvider _provider = LoginProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _provider),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
