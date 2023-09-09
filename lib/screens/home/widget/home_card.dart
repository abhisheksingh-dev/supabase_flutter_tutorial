import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_app_example/screens/auth/view/auth_view.dart';
import 'package:supabase_app_example/screens/home/model/home_card_model.dart';
import 'package:supabase_app_example/screens/native_auth/view/native_auth_view.dart';
import 'package:supabase_app_example/screens/widgets/glass_morphism.dart';

class SupabaseHomeCardsWidget extends StatelessWidget {
  const SupabaseHomeCardsWidget({
    super.key,
    required this.model,
  });
  final HomeCardModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {
          switch (model.onTapCat) {
            case 'AUTH':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthView(model: model),
                  ));
              break;
            case 'NATIVE AUTH':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NativeAuthView(model: model),
                  ));
              break;
            default:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthView(model: model),
                  ));
          }
        },
        child: GlassMorphism(
          blur: 10,
          color: Colors.black,
          opacity: 0.2,
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width / 2 - 40,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(),
                    child: Center(
                      child: FaIcon(
                        model.icon,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Text(
                    model.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SizedBox(
                      child: Text(
                        model.subTitle,
                        style: const TextStyle(
                          color: Colors.white38,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
