import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practice3/model/store.dart';

//1. UI와 로직 분리를 위해 레퍼지토리 생성
//mvvm 패턴에서의 모델이다. = 스토어 정보를 가져오는 모델 (즉 데이터 가져오는 처리를 한다.)
class StoreRepository {
  Future<List<Store>> fetch() async {
    final List<Store> stores = [];
    var url =
        'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json?lat=37.266389&lng=126.999333&m=5000';

    var response = await http.get(Uri.parse(url));
    final jsonResult = jsonDecode(response.body);
    final jsonStores = jsonResult['stores'];

    jsonStores.forEach((e) {
      stores.add(Store.fromJson(e));
    });

    return stores.where((e)
    => e.remainStat == 'plenty' ||
        e.remainStat == 'some' ||
        e.remainStat == 'few'
    ).toList();
  }
}
// main에 있던 fetch 함수를 레퍼지토리로 분리시킴
// 레퍼지토리로 이동한 fetch 함수는 더이상 void가 될 수 없기 때문에 retrun 이 꼭 필요하다.
// main 파일에 같이 있을 때는 상단에 전역변수가 있어서 그냥 호출하면 되지만
// 폴더가 나뉘게 되면 받아서 써야 한다 -> return이 없으면 받을게 없게 된다.
