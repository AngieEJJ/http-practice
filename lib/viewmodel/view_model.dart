import 'package:flutter/cupertino.dart';
import 'package:practice3/model/store.dart';
import 'package:practice3/repository/store_repository.dart';

// 2. view에서 레퍼지토리를 받는게 아니라 view-model을 한번 더 거치게 한다.
// 그리고 setState를 없애기 위해 provider를 사용한다.
class StoreModel with ChangeNotifier { // 1) ChangeNotifier 구현을 위해 상속
  var isLoading = false;
  List<Store> stores = [];
  final _storeRepository = StoreRepository();
  // 2) view는 viewmodel을 통해서만 로직에 접근이 가능하다. (view는 접근할 수 없게 private으로 숨김)
// 따라서 viewmodel이 레퍼지토리에 접근할 수 있도록 해야한다.

  StoreModel() {
    fetch2();
  }



Future fetch2() async {
    isLoading = true;
    notifyListeners();

    stores = await _storeRepository.fetch();
  isLoading = false;
  notifyListeners();
}
}