import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase_app_example/main.dart';
import 'package:supabase_app_example/screens/widgets/custom_snackbar.dart';
import 'package:supabase_app_example/screens/widgets/glass_app_bar.dart';
import 'package:supabase_app_example/screens/widgets/glass_morphism.dart';

class SignupEmailView extends StatefulWidget {
  const SignupEmailView({super.key});

  @override
  State<SignupEmailView> createState() => _SignupEmailViewState();
}

class _SignupEmailViewState extends State<SignupEmailView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: GlassAppBar(
            title: 'Signup With Email',
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
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GlassMorphism(
                          blur: 10,
                          color: Colors.black,
                          opacity: 0.2,
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Signup With Email',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    controller: emailController,
                                    validator: (e) {
                                      if (e == null || e.isEmpty) {
                                        return 'cannot be empty';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: const TextStyle(
                                          color: Colors.white54),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.white54),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.white54),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.white54),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.white54),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.white54),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.white54),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    controller: passwordController,
                                    validator: (e) {
                                      if (e == null || e.isEmpty) {
                                        return 'cannot be empty';
                                      }
                                      if (e.trim().length < 6) {
                                        return 'cannot be less than 6 characters';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(color: Colors.white),
                                    obscureText: obscureText,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            obscureText = !obscureText;
                                          });
                                        },
                                        icon: obscureText
                                            ? const Icon(
                                                Icons.visibility_off,
                                                color: Colors.white,
                                              )
                                            : const Icon(
                                                Icons.visibility,
                                                color: Colors.white,
                                              ),
                                      ),
                                      hintText: 'Password',
                                      hintStyle: const TextStyle(
                                          color: Colors.white54),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.white54),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.white54),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.white54),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.white54),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.white54),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.white54),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  GestureDetector(
                                    onTap: () async {
                                      if (formKey.currentState!.validate()) {
                                        try {
                                          var res = await supabase.auth.signUp(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );
                                          if (res.user != null) {
                                            if (mounted) {
                                              context.showSnackBar(
                                                  message:
                                                      'User logged in with ${res.user!.id}');
                                            }
                                          }
                                        } catch (e) {
                                          if (mounted) {
                                            context.errorSnakBar(
                                                message:
                                                    'Something went wrong $e');
                                          }
                                        }
                                      }
                                    },
                                    child: GlassMorphism(
                                      blur: 10,
                                      color: Colors.white,
                                      opacity: 0.2,
                                      borderRadius: BorderRadius.circular(12),
                                      child: SizedBox(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: const Center(
                                          child: Text(
                                            'Sign Up',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
