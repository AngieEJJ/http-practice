import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_info_app/api/movie_info_api.dart';
import 'package:movie_info_app/model/movie_info.dart';
import 'package:movie_info_app/model/photo.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<MovieInfo> movieInfoList = [];
  final List<Photo> photoList = [];
  final MovieInfoApi movieInfoApi = MovieInfoApi(); //(추가) MovieInfoApi 인스턴스생성

  @override
  void initState() {
    getMovieInfo(); // (추가) getInfo였으나 새롭게 생긴 getMovieInfo 함수가 이제 실행되어야 하니 바뀜.
    getPhoto();
    super.initState();
  }

  Future getMovieInfo() async { //(추가) getInfo함수를 여기서 만들었으나, 따로 뻈기 때문에 그 함수를 불러올 또 다른 함수 생성.
    final List<MovieInfo> infoList = await movieInfoApi.getInfo();
    setState(() {
      movieInfoList.addAll(infoList); // (추가) 새롭게 생긴 infoList가 이제 우리가 필요한 데이터이며, 모든 데이터는 movieInfoList에 들어간다.
    });
  }

  Future getPhoto() async {
    final response2 = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    // print(response2.statusCode); // 200
    final jsonPhoto = jsonDecode(response2.body);

    setState(() {
      jsonPhoto.forEach((e) {
        photoList.add(Photo.fromJson(e));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('영화정보 api 연습'),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: movieInfoList.length, // (추가) 우리가 필요한 데이터 리스트가 담겨있음.
          itemBuilder: (BuildContext context, int index) {

            return Column(
              children: [
                Image.network(photoList[index].thumbnailUrl.toString(),
                    height: 150),
                Text(
                  movieInfoList[index].title ?? '',
                )
              ],
            );
          }),
    );
  }
}
