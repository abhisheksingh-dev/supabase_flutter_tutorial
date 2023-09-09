import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:supabase_app_example/main.dart';
import 'package:supabase_app_example/model/terminal_model.dart';
import 'package:supabase_app_example/provider/login_provider.dart';
import 'package:supabase_app_example/screens/widgets/custom_snackbar.dart';
import 'package:supabase_app_example/screens/widgets/glass_app_bar.dart';
import 'package:supabase_app_example/screens/widgets/glass_morphism.dart';

class MagicLoginView extends StatefulWidget {
  const MagicLoginView({super.key});

  @override
  State<MagicLoginView> createState() => _MagicLoginViewState();
}

class _MagicLoginViewState extends State<MagicLoginView> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscureText = true;
  List<TerminalModel> terminal_model = [];

  @override
  void dispose() {
    emailController.dispose();
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
            title: 'Signup With Email Magic Link',
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
                                        addToTerminalMessage(
                                            msg: 'email cannot be empty');
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
                                  GestureDetector(
                                    onTap: () async {
                                      if (formKey.currentState!.validate()) {
                                        try {
                                          // If you are using this fuction it seems like it has no response so you don't know if it worked or not. So please use your real email id if testing.
                                          // If you are implementing this function so please setup redirect url with package name. because without that it will not work
                                          // I will be implementing this function and hosting it so I will not be publishing package name and id on github
                                          // This is the link to configure your app/site url - > Reffrence link - https://supabase.com/dashboard/project/cjkbxthppyceqhsfferh/auth/url-configuration?
                                          // This is the offcial implementation -> Reffrence link - https://supabase.com/docs/reference/dart/auth-signinwithotp
                                          await supabase.auth.signInWithOtp(
                                              email: emailController.text);
                                          addToTerminalMessage(
                                              msg:
                                                  'Email Sent to the ${emailController.text}');
                                        } catch (e) {
                                          if (mounted) {
                                            addToTerminalMessage(
                                                msg: 'Error --> $e');
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
