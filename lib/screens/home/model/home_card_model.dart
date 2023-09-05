import 'package:flutter/material.dart';

class HomeCardModel {
  late String title;
  late String subTitle;
  late IconData icon;
  late String onTapCat;

  HomeCardModel({
    required this.subTitle,
    required this.title,
    required this.icon,
    required this.onTapCat,
  });
}
