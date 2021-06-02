import 'package:flutter/material.dart';
import '../../models/tab.dart';
import 'bottom_navigation.dart';
import 'tab_navigator.dart';

// Наша главная страница будет содержать состояние
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // GlobalKey будет хранить уникальный ключ,
  // по которому мы сможем получить доступ
  // к виджетам, которые уже находяться в иерархии
  // NavigatorState - состояние Navigator виджета
  final _navigatorKeys = {
    TabItem.POSTS: GlobalKey<NavigatorState>(),
    TabItem.ALBUMS: GlobalKey<NavigatorState>(),
    TabItem.TODOS: GlobalKey<NavigatorState>(),
  };

  // текущий выбранный элемент
  var _currentTab = TabItem.POSTS;

  // выбор элемента меню
  void _selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    // WillPopScope переопределяет поведения
    // нажатия кнопки Back
    return WillPopScope(
      // логика обработки кнопки back может быть разной
      // здесь реализована следующая логика:
      // когда мы находимся на первом пункте меню (посты)
      // и нажимаем кнопку Back, то сразу выходим из приложения
      // в противном случае выбранный элемент меню переключается
      // на предыдущий: c заданий на альбомы, с альбомов на посты,
      // и после этого только выходим из приложения
      onWillPop: () async {
          if (_currentTab != TabItem.POSTS) {
            if (_currentTab == TabItem.TODOS) {
              _selectTab(TabItem.ALBUMS);
            } else {
              _selectTab(TabItem.POSTS);
            }
            return false;
          } else {
            return true;
          }

      },
      child: Scaffold(
        // Stack размещает один элемент над другим
        // Проще говоря, каждый экран будет находится
        // поверх другого, мы будем только переключаться между ними
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.POSTS),
          _buildOffstageNavigator(TabItem.ALBUMS),
          _buildOffstageNavigator(TabItem.TODOS),
        ]),
        // MyBottomNavigation мы создадим позже
        bottomNavigationBar: MyBottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),);
  }

  // Создание одного из экранов - посты, альбомы или задания
  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      // Offstage работает следующим образом:
      // если это не текущий выбранный элемент
      // в нижнем меню, то мы его скрываем
      offstage: _currentTab != tabItem,
      // TabNavigator мы создадим позже
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }

}