import 'package:flutter/material.dart';

import 'widgets/home_veiw_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeVeiwBody(),
    );
  }
}
