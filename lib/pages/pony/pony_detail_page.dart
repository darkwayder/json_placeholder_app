
import 'package:flutter/material.dart';

import 'pony_list_page.dart';

// также, как и PonyListPage наша страница
// не будет иметь состояния
class PonyDetailPage extends StatelessWidget {
  // в качестве параметра мы будет получать id пони
  final int ponyId;

  // конструктор PonyDetailPage, принимает pony id,
  // который мы объявили ранее
  PonyDetailPage(this.ponyId);

  @override
  Widget build(BuildContext context) {
    // получаем пони по его id
    // обратите внимание: мы импортируем ponies
    // из файла pony_list_page
    final pony = ponies[ponyId];
    return Scaffold(
      appBar: AppBar(
        title: Text("Pony Detail Page"),
      ),
      body: Padding(
        // указываем отступ для контента
        padding: EdgeInsets.all(15),
        // Column размещает дочерние виджеты в виде колонки
        // crossAxisAlignment - выравнивание по ширине (колонка) или
        // по высоте (строка)
        // mainAxisAlignment работает наоборот
        // в данном случае мы растягиваем дочерние элементы
        // на всю ширину колонки
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: EdgeInsets.all(10),
                // вы не можете указать color для Container,
                // т.к. свойство decoration было определено
                // color: Colors.pinkAccent,

                // BoxDecoration имеет дополнительные свойства,
                // посравнению с Container,
                // такие как gradient, borderRadius, border, shape
                // и boxShadow
                // здесь мы задаем радиус закругления левого и правого
                // верхних углов
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                  ),
                  // обратите внимание,
                  // если вы указываете параметр decoration,
                  // то вы не можете указать цвет для Container
                  color: Colors.pinkAccent,
                ),
                child: Text(
                    // указываем имя pony
                    pony.name,
                    style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                )
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: Text(
                    // указываем описание pony
                    pony.desc,
                    style: Theme.of(context).textTheme.bodyText1
                )
            )
          ],
        ),
      )
    );
  }
}