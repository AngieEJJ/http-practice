import 'package:flutter/cupertino.dart';
import 'package:mvvm_with_provider/data/repository/image_item_repository.dart';
import 'package:mvvm_with_provider/data/repository/image_item_repository_impl.dart';
import '../data/model/image_item.dart';

class MainViewModel extends ChangeNotifier{
  final ImageItemRepository repository;
  MainViewModel({
    required this.repository,
  });

  final _repository = ImageItemRepositoryImpl();
  List<ImageItem> _imageItems = [];

  List<ImageItem> get imageItems => List.unmodifiable(_imageItems);
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> searchImage(String query) async {
    _isLoading = true;
    notifyListeners();

    _imageItems = await _repository.getImageItems(query);
    _isLoading = false;
    notifyListeners();


  }
}