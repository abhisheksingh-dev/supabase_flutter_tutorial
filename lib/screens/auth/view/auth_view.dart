import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase_app_example/screens/auth/screens/signup/view/signup_email_view.dart';
import 'package:supabase_app_example/screens/home/model/home_card_model.dart';
import 'package:supabase_app_example/screens/widgets/glass_app_bar.dart';
import 'package:supabase_app_example/screens/widgets/glass_morphism.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key, required this.model});
  final HomeCardModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: GlassAppBar(
          title: model.title,
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
                            builder: (context) => SignupEmailView(),
                          ),
                        );
                      },
                      title: 'Signup With Email',
                      subTitle: 'Signup With Email And Password',
                    ),
                    FunctionCard(
                      onTap: () {},
                      title: 'Login With Email',
                      subTitle: 'Login With Email And Password',
                    ),
                    FunctionCard(
                      onTap: () {},
                      title: 'Login With Email & OTP',
                      subTitle: 'Login With Email And OTP',
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

class FunctionCard extends StatelessWidget {
  const FunctionCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });
  final String title;
  final String subTitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: GestureDetector(
        onTap: onTap,
        child: GlassMorphism(
          blur: 10,
          color: Colors.black,
          opacity: 0.2,
          borderRadius: BorderRadius.circular(12),
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              subTitle,
              style: const TextStyle(color: Colors.white54),
            ),
            trailing: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
