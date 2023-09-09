import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase_app_example/screens/auth/widget/function_card.dart';
import 'package:supabase_app_example/screens/home/model/home_card_model.dart';
import 'package:supabase_app_example/screens/native_auth/screens/apple/apple_login_view.dart';
import 'package:supabase_app_example/screens/widgets/glass_app_bar.dart';

class NativeAuthView extends StatelessWidget {
  const NativeAuthView({super.key, required this.model});

  final HomeCardModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: GlassAppBar(
          title: model.title,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: LottieBuilder.asset(
              'assets/blu.json',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 120),
                    FunctionCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppleLoginView(),
                          ),
                        );
                      },
                      title: 'Apple Signin',
                      subTitle: 'Login With apple devices',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
