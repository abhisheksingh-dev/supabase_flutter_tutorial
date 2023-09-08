import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:supabase_app_example/main.dart';
import 'package:supabase_app_example/model/terminal_model.dart';
import 'package:supabase_app_example/provider/login_provider.dart';
import 'package:supabase_app_example/screens/widgets/custom_snackbar.dart';
import 'package:supabase_app_example/screens/widgets/glass_app_bar.dart';
import 'package:supabase_app_example/screens/widgets/glass_morphism.dart';

class LoginWithEmail extends StatefulWidget {
  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool obscureText = true;

  List<TerminalModel> terminal_model = [];

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
            title: 'Signup With Email',
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
                                  TextFormField(
                                    controller: passwordController,
                                    validator: (e) {
                                      if (e == null || e.isEmpty) {
                                        addToTerminalMessage(
                                            msg: 'password cannot be empty');
                                        return 'cannot be empty';
                                      }
                                      if (e.trim().length < 6) {
                                        addToTerminalMessage(
                                            msg:
                                                'password cannot be less than 6 characters');
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
                                        var authHandeler =
                                            Provider.of<LoginProvider>(context,
                                                listen: false);
                                        try {
                                          var res = await supabase.auth
                                              .signInWithPassword(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );
                                          if (res.user != null) {
                                            authHandeler.updateLoginStatus(
                                                res: true);
                                            addToTerminalMessage(
                                                msg:
                                                    'user Successfully logged in ${res.user!.id}');
                                            if (mounted) {
                                              context.showSnackBar(
                                                  message:
                                                      'User logged in with ${res.user!.id}');
                                            }
                                          }
                                        } catch (e) {
                                          authHandeler.updateLoginStatus(
                                              res: false);
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
