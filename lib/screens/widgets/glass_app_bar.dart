// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:supabase_app_example/const.dart';
import 'package:supabase_app_example/main.dart';
import 'package:supabase_app_example/provider/login_provider.dart';
import 'package:supabase_app_example/screens/widgets/glass_morphism.dart';

class GlassAppBar extends StatelessWidget {
  GlassAppBar({Key? key, required this.title, this.actions, this.onPressed})
      : super(key: key);
  final String title;
  final List<Widget>? actions;
  void Function()? onPressed;

  List<Widget> returnActionList(
      {required List<Widget> actions,
      required LoginProvider value,
      required BuildContext context}) {
    List<Widget> returnWidget = [];
    returnWidget.addAll(actions);
    returnWidget.add(
      Row(
        children: [
          buildSuccessIndicator(
              value.loginStatus == LoginStatus.success, context),
        ],
      ),
    );
    return returnWidget;
  }

  ///Wrong conveniton to name a parameter as in the large code base you will not be abe to track this irrelavent name which provide 0 call back for its data type
  Widget buildSuccessIndicator(status, context) {
    return GestureDetector(
      onTap: () => ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            content: Text(status ? 'User Loggin success' : 'User Login failed'),
          ),
        ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: status ? Colors.green : Colors.red,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, value, child) {
        return GlassMorphism(
          blur: 10,
          color: Colors.black,
          opacity: 0.3,
          child: AppBar(
            automaticallyImplyLeading: false,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.transparent,
            elevation: 1,
            centerTitle: false,
            leading: (onPressed != null)
                ? IconButton(
                    onPressed: onPressed,
                    icon: Icon(Icons.keyboard_arrow_left),
                    splashColor: devicePlatform == DevicePlatform.android
                        ? null
                        : Colors.transparent,
                    highlightColor: devicePlatform == DevicePlatform.android
                        ? null
                        : Colors.transparent,
                  )
                : null,
            title: Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
            actions: (value.loginStatus != LoginStatus.idle)
                ? returnActionList(
                    actions: actions ?? [], value: value, context: context)
                : actions,
          ),
        );
      },
    );
  }
}
