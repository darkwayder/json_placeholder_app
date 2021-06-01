import 'package:flutter/material.dart';

// StatefulWidget имеет состояние, с которым
// позже мы будем работать через функцию
// setState(VoidCallback fn);
// обратите внимание setState принимает другую функцию
class HomePage extends StatefulWidget {
  // StatefulWidget должен возвращать класс,
  // которые наследуется от State
  @override
  _HomePageState createState() => _HomePageState();
}

// В треугольных скобках мы указываем наш StatefulWidget
// для которого будет создано состояние
// нижнее подчеркивание используется для того, чтобы
// скрыть доступ к _HomePageState из других файлов
// нижнее подчеркивание - аналогия private в Java / Kotlin
class _HomePageState extends State<HomePage> {

  // добавим переменную, которая будет нашим состоянием
  // т.к. _counter мы будем использовать только внутри нашего
  // класса, то сделаем его недоступным для других классов
  // _counter будет хранить значение счетчика
  var _counter = 0;

  // build как мы уже отметили, строит
  // иерархию наших любимых виджетов
  @override
  Widget build(BuildContext context) {
    // В большинстве случаев Scaffold используется
    // как корневой виджет для страницы или экрана
    // Scaffold позволяет вам указать AppBar, BottomNavigationBar,
    // Drawer, FloatingActionButton и другие не менее важные
    // компноненты (виджеты).
    return Scaffold(
      // мы создаем AppBar с текстом "Home page"
      appBar: AppBar(title: Text("Home page")),
      // указываем текст в качестве тела Scaffold
      // текст предварительно вложен в Center виджет,
      // чтобы выровнять его по центру
      body: Center(
        // добавляем AnimatedSwitcher, который и будет управлять
        // нашей анимацией
          child: AnimatedSwitcher(
            // обратите внимание: const указывает
            // на то, что нам известно значение Duration во время
            // компиляции и мы не будем его менять во время выполнения
            // класс Duration позволяет указать задержку в разных
            // единицах измерения (секунды, миллисекунды и т.д.)
            duration: const Duration(milliseconds: 900),
            // AnimatedSwitcher создает reverse эффект,
            // то  есть эффект возврата анимации к первоначальному
            // состоянию, что выглядит не всегда красиво,
            // поэтому я указал reverseDuration в 0
            // вы можете поэкспериментировать с этим значением
            reverseDuration: const Duration(milliseconds: 0),
            child: Text(
              // вывод значения счетчика
              // при каждой перерисовки виджетов _counter
              // увеличивается на единицу
              "$_counter",
              // здесь самое интересное
              // когда мы изменяем значение _counter
              // и вызываем функцию setState, компоненты
              // перерисовываются и AnimatedSwitcher сравнивает
              // предыдущий key своего дочернего виджета с текущим,
              // если они не совпадают, то вопроизводит анимацию
              key: ValueKey<int>(_counter),
              // Также выравниваем текст внутри самого виджета Text
              textAlign: TextAlign.center,
              // Theme.of(context) позволяет получить доступ к
              // текущему ThemeData, который мы указали в MaterialApp
              // После получения ThemeData мы можем использовать
              // различные его стили (например headline3, как здесь)
              style: Theme.of(context).textTheme.headline3,
            ),
          )
      ),
      // добавляем кнопку
      // FloatingActionButton - круглая кнопка в правом нижнем углу
      floatingActionButton: FloatingActionButton(
        // указываем иконку
        // Flutter предлагает нам большой спектр встроенных иконок
        child: Icon(Icons.animation),
        onPressed: () {
          // наконец то мы дошли до функции setState
          // которая даст сигнал, что пора перерисовывать
          // наши виджеты.
          // здесь мы просто увеличиваем наш счетчик
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }

}