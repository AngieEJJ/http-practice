import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieInfoApi {
  Future getInfo() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    // print(response.statusCode); // 200
    final jsonResult = jsonDecode(response.body);
    // print(jsonResult); //Map형태

    }

  }
