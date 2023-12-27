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
  final searchTextEditingController = TextEditingController();
  final repository = PixabayImageItemRepository();
  List<ImageItem> imageItems = [];
  bool isLoading = true;

  Future<void> searchImage(String query) async {
    setState(() {
      isLoading = false;
    });
    imageItems = await repository.getImageItems(query);
    setState(() {});
  }

  @override
  void dispose() {
    searchTextEditingController.dispose();
    super.dispose();
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
                controller: searchTextEditingController,
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
                      searchImage(searchTextEditingController.text); //아이콘 클릭시 text를 얻어와서 textfield에 들어가도록.
                    },
                    child: const Icon(
                      Icons.search,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              isLoading ? const Center(child: CircularProgressIndicator())
              : Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                  ),
                  itemCount: imageItems.length,
                  itemBuilder: (context, index) {
                    final imageItem = imageItems[index];
                    return ImageItemWidget(imageitem: imageItem);
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
