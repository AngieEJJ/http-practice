import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/data/di/di_setup.dart';
import 'package:mvvm_with_provider/ui/main_page.dart';
import 'package:mvvm_with_provider/ui/main_view_model.dart';
import 'package:provider/provider.dart';

import 'data/repository/image_item_repository.dart';

void main() {
  diSetup();
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
      home: ChangeNotifierProvider (
        create: (_) => MainViewModel(repository: getIt<ImageItemRepository>()),
        child: const MainPage(),
      )
    );
  }
}
//ChangeNotifierProvider는 앱의 루트에서 MainViewModel을 생성
// MainPage에서는 해당 뷰 모델에 접근할 수 있게 된다.