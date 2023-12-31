import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice3/model/store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final List<Store> stores =[];

  Future fetch() async {
    var url = 'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json?lat=37.266389&lng=126.999333&m=5000';

    var response = await http.get(Uri.parse(url));
    final jsonResult = jsonDecode(response.body);
    final jsonStores = jsonResult['stores'];


    setState(() {
      jsonStores.forEach((e) {
      stores.add(Store.fromJson(e));
    });
    });
    //



  }
//jsonStores 배열의 각 json요소에 대해 store객체로 변환하고, 그 결과를 store 리스트에 추가한다.
//서버에서 받아온 Json 데이터는 dart 객체인 store 객체로 변환이 필요하다.
// 그 후에 리스트에 저장하는 것이다.

@override
void initState() {
  super.initState();
  fetch();
} // 버튼을 누르는 등의 동작을 하지 않아도 앱 실행할 때 바로 실행되려면 initstate필요
//다만 setstate를 해줘야 화면에 뜨기 때문에 감싸줘야한다.


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('데이터통신 연습'),),
      body: ListView(
        children: stores.map((e) =>
        ListTile(
          title: Text(e.name ?? ''),
          subtitle:  Text(e.addr ?? ''),
          trailing: Text(e.remainStat ?? 'soldout'),

        )
        ).toList(),
        //stores안의 store들을 변경하겠다.

      ),
    );
  }
}

