
import 'package:flutter/material.dart';

// будет хранить основную информацию
// об элементах меню
class MyTab {
  final String? name;
  final MaterialColor? color;
  final IconData? icon;

  const MyTab({this.name, this.color, this.icon});
}

// пригодиться для определения
// выбранного элемента меню
// у нас будет три страницы:
// посты, альбомы и задания
enum TabItem { POSTS, ALBUMS, TODOS }