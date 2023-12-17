import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeBarView extends StatefulWidget {
  final PageController controller;

  const HomeBarView({super.key, required this.controller});

  @override
  State<HomeBarView> createState() => _HomeBarViewState();
}

class _HomeBarViewState extends State<HomeBarView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        currentPage = widget.controller.page!.round();
      });
    });
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      surfaceTintColor: Colors.transparent,
      color: const Color(0xff1d1d1f),
      shape: const CircularNotchedRectangle(),
      padding: const EdgeInsets.only(top: 12),
      notchMargin: 10,
      elevation: 55,
      child: Row(
        children: [
          ItemBottom(
            isSelected: currentPage == 0,
            unselectedImage: "home",
            image: "home",
            title: "Home",
            onTap: () {
              widget.controller.jumpToPage(0);
              currentPage = 0;
              setState(() {});
            },
          ),
          ItemBottom(
            unselectedImage: "message",
            isSelected: currentPage == 1,
            image: "search",
            title: "Search",
            onTap: () {
              widget.controller.jumpToPage(1);
              currentPage = 1;
              setState(() {});
            },
          ),
          ItemBottom(
              isSelected: currentPage == 2,
              image: "shopping-cart",
              unselectedImage: "briefcase",
              title: "Cart",
              onTap: () {
                widget.controller.jumpToPage(2);
                currentPage = 2;
                setState(() {});
              }),
          ItemBottom(
            isSelected: currentPage == 3,
            image: "profile",
            unselectedImage: "profile",
            title: "Profile",
            onTap: () {
              widget.controller.jumpToPage(3);
              currentPage = 4;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

class ItemBottom extends StatelessWidget {
  final String title, image, unselectedImage;
  final VoidCallback onTap;
  final bool isSelected;

  const ItemBottom(
      {Key? key,
      required this.title,
      required this.image,
      required this.onTap,
      this.isSelected = false,
      required this.unselectedImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/icons/$image.svg",
              color: isSelected ? Color(0xffbfff36) : Color(0xfff5f5f7),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: isSelected ? Color(0xffbfff36) : Color(0xfff5f5f7)),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
