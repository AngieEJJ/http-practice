import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/ui/main_view_model.dart';
import 'package:mvvm_with_provider/ui/widget/detail_page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final viewModel = MainViewModel();
  final searchTextEditingController = TextEditingController();

  @override
  void dispose() {
    searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(children: [
            TextField(
              controller: searchTextEditingController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Color(0xFF4FB6B2),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Color(0xFF4FB6B2),
                  ),
                ),
                hintText: 'Search',
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Color(0xFF4FB6B2),
                  ),
                  onPressed: () async {
                    await viewModel.searchImage(searchTextEditingController.text);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            viewModel.isLoading
            ? const Center(child: CircularProgressIndicator(),
            )
            :

            Expanded(
              child: GridView.builder(
                itemCount: viewModel.imageItems.length,
                itemBuilder: (context, index) {
                  final imageItem = viewModel.imageItems[index];
                  return GestureDetector(
                    child: Hero(
                      tag: imageItem.imageUrl,
                      child:
                          Image.network(imageItem.imageUrl, fit: BoxFit.cover),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  DetailPage(imgUrl: imageItem.imageUrl,),
                        ),
                      );
                    },
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
