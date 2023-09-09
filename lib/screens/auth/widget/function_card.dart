import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_app_example/screens/widgets/glass_morphism.dart';

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
