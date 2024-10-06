import 'package:flutter/material.dart';

import '../core/data/dummy_data.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: GridView.builder(
        itemCount: Dummy.categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) => Column(
          children: [
            Image.asset(
              Dummy.categories[index]["image"]!,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              Dummy.categories[index]["label"]!,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Categories"),
    );
  }
}
