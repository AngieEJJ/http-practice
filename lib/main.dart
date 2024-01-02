import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:practice3/model/store.dart';
import 'package:practice3/repository/store_repository.dart';

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
  var isLoading = true;
  var stores = [];
  final storeRepository = StoreRepository();

  @override
  void initState() {
    super.initState();
    //initState에서는 동기식으로 만들 수 없어서 then 활용 (fetch가 수행된 이후에 뭘 하라는 코드를 만들고 싶어서!)
    //fetch로 가져온 결과인 valu를 stores 변수에 업데이트 한다. 그리고 화면을 다시 그린다.
    //storeRepository.fetch()를 호출하고, setState 호출하여 화면을 업뎃하여 새로운 데이터를 표시한다.
    //최신데이터를 가져와 UI를 갱신한다.
    //만약 then이 없다면 비동기 작업이 완료됙 전에 다음 코드가 실행되어 데이터가 업데이트 되지 않은 채로 UI가 갱신된다.
    storeRepository.fetch().then((value) {
      setState(() {
        stores = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '마스크 재고 있는 곳 : ${stores.where((e) => e.remainStat == 'plenty' || e.remainStat == 'some').length}곳'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                storeRepository.fetch().then((value) {
                  setState(() {
                    stores = value;
                  });
                });
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: stores
                  .where(
                      (e) => e.remainStat == 'plenty' || e.remainStat == 'some')
                  .map((e) => ListTile(
                        title: Text(e.name ?? ''),
                        subtitle: Text(e.addr ?? ''),
                        trailing: _buildRemainStatWidget(e), //e: Store 객체
                      ))
                  .toList(),
            ),
    );
  }

  Widget _buildRemainStatWidget(Store store) {
    var remainStat = '판매중지';
    var description = '';
    var color = Colors.black;
    switch (store.remainStat) {
      case 'plenty':
        remainStat = '충분';
        description = '100개 이상';
        color = Colors.green;
        break;
      case 'some':
        remainStat = '보통';
        description = '30개 이상';
        color = Colors.yellow;
        break;
      case 'few':
        remainStat = '부족';
        description = '2개 이상';
        color = Colors.red;
        break;
      case 'empty':
        remainStat = '소진임밥';
        description = '1개 이하';
        color = Colors.grey;
        break;
      default:
    }

    return Column(
      children: <Widget>[
        Text(remainStat, style: TextStyle(color: color)),
        Text(description, style: TextStyle(color: color)),
      ],
    );
  }
}
