import 'package:flutter/material.dart';

import 'widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add Categories'),
        centerTitle: false,
      ),
      body: CategoriesViewBody(),
    );
  }
}
