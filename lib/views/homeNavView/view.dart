import 'package:flutter/material.dart';
import 'package:slash_new/views/homeNavView/searchScreen/view.dart';

import 'cartScreen/view.dart';
import 'homeBar/view.dart';
import 'homeScreen/view.dart';
import 'profileScreen/view.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({super.key, required this.title});

  static List<Widget> pages = const [
    HomeScreenView(),
    SearchPageView(),
    CartPageView(),
    ProfilePageView()
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(
        body: Center(
          child: PageView.builder(
            itemCount: pages.length,
            controller: controller,
            itemBuilder: (context, index) => pages[index],
          ),
          // pages[currentPage],
        ),
        bottomNavigationBar: HomeBarView(
          controller: controller,
        ));
  }
}
