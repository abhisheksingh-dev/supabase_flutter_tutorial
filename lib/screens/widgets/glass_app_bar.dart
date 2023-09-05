// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_app_example/screens/widgets/glass_morphism.dart';

class GlassAppBar extends StatelessWidget {
  GlassAppBar({Key? key, required this.title, this.actions, this.onPressed})
      : super(key: key);
  final String title;
  final List<Widget>? actions;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
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
        title: Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
        actions: actions,
      ),
    );
  }
}
