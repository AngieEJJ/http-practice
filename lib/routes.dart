import 'package:go_router/go_router.dart';
import 'package:mvvm_with_provider/ui/main_page.dart';
import 'package:mvvm_with_provider/ui/main_view_model.dart';
import 'package:provider/provider.dart';
import 'data/di/di_setup.dart';
import 'data/repository/image_item_repository.dart';

final router = GoRouter(routes: [
  GoRoute(path: '/',
  builder: (context, state) =>  ChangeNotifierProvider (
    create: (_) => MainViewModel(repository: getIt<ImageItemRepository>()),
    child: const MainPage(),
  )

  )

]);