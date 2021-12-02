import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  final int id;
  final String name;
  final dynamic icon;
  Category(this.id, this.name, {this.icon});
}

final List<Category> categories = [
  Category(
    9,
    "Вводный урок",
    icon: FontAwesomeIcons.globeAsia,
  ),
  Category(
    10,
    "Тест Амтхауэра",
    icon: FontAwesomeIcons.bookOpen,
  ),
  Category(
    11,
    "Управление камерой",
    icon: FontAwesomeIcons.video,
  ),
  Category(
    14,
    "Мониторинг показателей",
    icon: FontAwesomeIcons.tv,
  ),
  Category(
    15,
    "Настройка контроллера управления",
    icon: FontAwesomeIcons.gamepad,
  ),
  Category(
    16,
    "Влияние погодных условий",
    icon: FontAwesomeIcons.wind,
  ),
  Category(
    22,
    "Посадка на сложной местности",
    icon: FontAwesomeIcons.mountain,
  ),
  Category(23, "Экзамен 1", icon: FontAwesomeIcons.fortAwesome),
  Category(24, "Экзамен 2", icon: FontAwesomeIcons.fortAwesome),
  Category(25, "Экзамен 3", icon: FontAwesomeIcons.fortAwesome),

  // Category(
  //   17,
  //   "Science & Nature",
  //   icon: FontAwesomeIcons.microscope,
  // ),
  // Category(
  //   18,
  //   "Computer",
  //   icon: FontAwesomeIcons.laptopCode,
  // ),
  // Category(
  //   19,
  //   "Maths",
  //   icon: FontAwesomeIcons.sortNumericDown,
  // ),
  // Category(20, "Mythology"),
  // Category(
  //   21,
  //   "Sports",
  //   icon: FontAwesomeIcons.footballBall,
  // ),

  // Category(
  //   23,
  //   "History",
  //   icon: FontAwesomeIcons.monument,
  // ),
  // Category(24, "Politics"),
  // Category(
  //   25,
  //   "Art",
  //   icon: FontAwesomeIcons.paintBrush,
  // ),
  // Category(26, "Celebrities"),
  // Category(
  //   27,
  //   "Animals",
  //   icon: FontAwesomeIcons.dog,
  // ),
  // Category(
  //   28,
  //   "Vehicles",
  //   icon: FontAwesomeIcons.carAlt,
  // ),
  // Category(29, "Comics"),
  // Category(
  //   30,
  //   "Gadgets",
  //   icon: FontAwesomeIcons.mobileAlt,
  // ),
  // Category(31, "Japanese Anime & Manga"),
  // Category(32, "Cartoon & Animation"),
];
