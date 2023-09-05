import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase_app_example/screens/home/model/home_card_model.dart';
import 'package:supabase_app_example/screens/home/widget/home_card.dart';
import 'package:supabase_app_example/screens/widgets/glass_app_bar.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final list = [
    HomeCardModel(
        title: 'Supabase Auth Functions',
        icon: FontAwesomeIcons.users,
        onTapCat: 'AUTH',
        subTitle:
            'A neat library to understand and implement Supabase auth functionalities with code'),
    HomeCardModel(
        title: 'Supabase Native Auth Functions',
        icon: FontAwesomeIcons.apple,
        onTapCat: 'NATIVE AUTH',
        subTitle:
            'A neat library to understand and implement Supabase auth functionalities with code'),
    HomeCardModel(
        title: 'Supabase Database',
        icon: FontAwesomeIcons.database,
        onTapCat: 'DATABASE',
        subTitle:
            'A neat library to understand and implement Supabase auth functionalities with code'),
    HomeCardModel(
        title: 'Supabase Storage',
        onTapCat: 'STORAGE',
        icon: FontAwesomeIcons.store,
        subTitle:
            'A neat library to understand and implement Supabase auth functionalities with code'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: GlassAppBar(
          title: 'Supabase Flutter Example',
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
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 320,
              ),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SupabaseHomeCardsWidget(
                  model: list[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
