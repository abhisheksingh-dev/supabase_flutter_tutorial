import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase_app_example/main.dart';
import 'package:supabase_app_example/model/terminal_model.dart';
import 'package:supabase_app_example/screens/widgets/custom_snackbar.dart';
import 'package:supabase_app_example/screens/widgets/glass_app_bar.dart';
import 'package:supabase_app_example/screens/widgets/glass_morphism.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppleLoginView extends StatefulWidget {
  const AppleLoginView({super.key});

  @override
  State<AppleLoginView> createState() => _AppleLoginViewState();
}

class _AppleLoginViewState extends State<AppleLoginView> {
  bool obscureText = true;
  List<TerminalModel> terminal_model = [];

  @override
  void dispose() {
    super.dispose();
  }

  addToTerminalMessage({required String msg, int? priority}) {
    setState(() {
      terminal_model.add(TerminalModel(
          dateTime: DateTime.now(), msg: msg, priority: priority ?? 5));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: GlassAppBar(
            title: 'Apple Signin',
            onPressed: () => Navigator.pop(context),
          ),
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Stack(
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
                                GestureDetector(
                                  onTap: () async {
                                    // There will be error which is comming as we don't have registered this app to
                                    // use appleSignIn from Xcode I will be sharing a step by step to guide how can
                                    // you do that till then follow this link -> https://developer.apple.com/help/account/manage-identifiers/register-an-app-id/
                                    try {
                                      var res =
                                          await supabase.auth.signInWithApple();
                                      if (res.user != null) {
                                        if (mounted) {
                                          context.showSnackBar(
                                              message:
                                                  'User logged in with ${res.user!.id}');
                                        }
                                      }
                                    } catch (e) {
                                      if (mounted) {
                                        addToTerminalMessage(
                                            msg: 'Error --> $e');
                                        context.errorSnakBar(
                                            message: 'Something went wrong $e');
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
                                      width: MediaQuery.of(context).size.width,
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.apple,
                                            color: Color.fromRGBO(
                                                238, 238, 238, 1),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            'Login With Apple',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: GlassMorphism(
                            blur: 10,
                            color: Colors.black,
                            opacity: 0.2,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Terminal',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: terminal_model.length,
                                        padding: const EdgeInsets.all(0),
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Text(
                                              '>>> DateTime: ${terminal_model[index].dateTime}\n Message: ${terminal_model[index].msg}',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
