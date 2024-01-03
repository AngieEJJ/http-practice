import 'package:get_it/get_it.dart';
import 'package:mvvm_with_provider/data/repository/image_item_repository_impl.dart';
import 'package:mvvm_with_provider/ui/main_view_model.dart';
import '../repository/image_item_repository.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<ImageItemRepository>(ImageItemRepositoryImpl());

  getIt.registerFactory<MainViewModel>(
          () => MainViewModel(repository: getIt<ImageItemRepository>()));
}
