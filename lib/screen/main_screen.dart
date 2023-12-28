import 'package:flutter/material.dart';
import 'package:practice_image_search/model/content_item.dart';
import 'package:practice_image_search/repository/content_item_repository.dart';
import 'package:practice_image_search/widget/Content_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchTextEditingController = TextEditingController();

  final repository = ContenItemRepository();

  List<ContentItem> imageItems = [];

Future<void> searchImage(String query) async {
  imageItems = await repository.getImagesItems(query);

  setState(() {

  });

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
          child: Column(children: [
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
                    searchImage(searchTextEditingController.text);
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
                    return ContentWidget(
                      contentItem: imageItems[index]
                      //ContentItem(imageUrl: 'Test로 확인') -> test용으로 처음 Model만들때 생성
                    );
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
