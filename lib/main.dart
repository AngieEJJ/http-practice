import 'package:flutter/material.dart';
import 'package:practice3/viewmodel/view_model.dart';
import 'package:provider/provider.dart';
import 'view/main_page.dart';

void main() {
  runApp(
      ChangeNotifierProvider.value(value: StoreModel(), // 통지를 받아서 변경이 필요한 곳에 알려줄 수 있다.
          child: MyApp(),
      ),
  );
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
      home:  MainPage(),
    );
  }
}




