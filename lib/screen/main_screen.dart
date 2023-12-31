import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_info_app/model/movie_info.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
final List<MovieInfo> movieInfoList = [];


  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
   // print(response.statusCode); // 200
    final jsonResult = jsonDecode(response.body);
    // print(jsonResult); //Map형태


   setState(() {
     jsonResult.forEach((e) {
       movieInfoList.add(MovieInfo.fromJson(e));
   });
   });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('영화정보 api 연습'),
      ),
      body: ListView(
        children: movieInfoList.map((e) => ListTile(
          title: Text(e.title ?? ''),
          subtitle: Text(e.id.toString()),
        ),
        ).toList(),


      )
    );
  }
}
