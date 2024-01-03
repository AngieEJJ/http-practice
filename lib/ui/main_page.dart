import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/ui/detail_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(children: [
            TextField(
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
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Hero(
                      tag: '1',
                      child: Image.network(
                          'https://cdn.pixabay.com/photo/2023/12/26/02/21/bird-8469368_640.jpg',
                          fit: BoxFit.cover),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailPage(),
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
