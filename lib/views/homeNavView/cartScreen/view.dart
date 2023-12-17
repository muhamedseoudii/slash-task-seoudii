import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_new/utils/helper_methods.dart';
import 'package:slash_new/views/homeNavView/view.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x42000000),
        centerTitle: false,
        title: Text(
          textAlign: TextAlign.start,
          "My Cart",
          style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 28.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 180),
          child: Column(
            children: [
              Image.asset("assets/images/cart.png",
                  fit: BoxFit.scaleDown, width: 170.w, height: 200.h),
              SizedBox(height: 70.h),
              Text(
                "Your Cart is empty!",
                style: TextStyle(color: Color(0xffFFFFFF), fontSize: 22.sp),
              ),
              SizedBox(height: 30.h),
              OutlinedButton(
                onPressed: () {
                  navigateTo(
                    context,
                    MyHomePage(title: "Home"),
                  );
                },
                child: Text(
                  "Let's go shopping",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
