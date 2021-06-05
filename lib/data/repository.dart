import 'dart:convert';

// импортируем http пакет
import 'package:http/http.dart' as http;
import 'package:json_placeholder_app/models/post.dart';

// мы ещё не раз будем использовать
// константу SERVER
const String SERVER = "https://jsonplaceholder.typicode.com";

class Repository {

  // обработку ошибок мы сделаем в контроллере
  // мы возвращаем Future объект, потому что
  // fetchPhotos асинхронная функция
  // асинхронные функции не блокируют UI
  Future<PostList> fetchPosts() async {
    // сначала создаем URL, по которому
    // мы будем делать запрос
    final url = Uri.parse("$SERVER/posts");
    // делаем GET запрос
    final response = await http.get(url);

    // проверяем статус ответа
    if (response.statusCode == 200) {
      // если все ок то возвращаем посты
      // json.decode парсит ответ
      return PostList.fromJson(json.decode(response.body));
    } else {
      // в противном случае вызываем исключение
      throw Exception("failed request");
    }
  }

  // добавление поста на сервер
  Future<PostAdd> addPost(Post post) async {
    final url = Uri.parse("$SERVER/posts");
    // делаем POST запрос, в качестве тела
    // указываем JSON строку нового поста
    final response = await http.post(url, body: post.toJson());
    // если пост был успешно добавлен
    if (response.statusCode == 201) {
      // то говорим, что все ок
      return PostAddSuccess();
    } else {
      // иначе ошибка
      return PostAddFailure();
    }
  }

}

