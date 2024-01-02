import 'package:flutter/material.dart';
import 'package:practice3/viewmodel/view_model.dart';
import 'package:provider/provider.dart';
import 'remain_stat_widget.dart';

class MainPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final storeModel = Provider.of<StoreModel>(context);
    // 이렇게 하면 제일 꼭대기에서 제공하는 storeModel의 인스턴스를 쓸 수 있게됨.
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '마스크 재고 있는 곳 : ${storeModel.stores.length}곳'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                storeModel.fetch2(); //값을 새로 받아서 통지를 받으면 빌드새로 실행
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: storeModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
        children: storeModel.stores
           .map((e) => ListTile(
          title: Text(e.name ?? ''),
          subtitle: Text(e.addr ?? ''),
          trailing: RemainStatWidget(e), //e: Store 객체
        ))
            .toList(),
      ),
    );
  }


}