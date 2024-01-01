import 'package:flutter/material.dart';
import 'package:movie_info_app/api/movie_info_api.dart';
import 'package:movie_info_app/model/movie_info.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<MovieInfo> movieInfoList = [];
  final MovieInfoApi movieInfoApi = MovieInfoApi();

  @override
  void initState() {
    getMovieInfo();
    super.initState();
  }

  Future getMovieInfo() async {
    final List<MovieInfo> infoList = await movieInfoApi.getData(); //getInfo 메서드를 호출하면 그 안에서 jsonResult가 생성되어서, 그 결과를 반환
    setState(() {
      infoList.forEach((e) {
        movieInfoList.add(MovieInfo.fromJson(e as Map<String, dynamic>)); //(추가) 새롭게 생긴 photoList가 이제 우리가 필요한 데이터이며, 모든 데이터는 photoInfoList에 들어간다.
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
