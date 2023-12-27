// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:image_search_app/model/image_item.dart';
import 'package:image_search_app/repository/image_item_repository.dart';
import 'package:image_search_app/widget/imgae_item_widget.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final repository = ImageItemRepository();
  var imageItems = [];

 Future <void> searchImage(String query) async {
   imageItems = await repository.getImageItems(query);
   setState(() {
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                  hintText: 'Search',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // print('tapped!');
                      searchImage('사과');
                    },
                    child: const Icon(
                      Icons.search,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                  ),
                  itemCount: imageItems.length,
                  itemBuilder: (context, index) {
                    final imageItem = imageItems[index];
                    return ImageItemWidget(
                        imageitem: imageItem);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
