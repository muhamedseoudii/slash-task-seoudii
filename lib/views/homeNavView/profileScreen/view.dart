import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_new/component/listDesign/view.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x42000000),
        centerTitle: false,
        title: Text(
          textAlign: TextAlign.start,
          "My Account",
          style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 28.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                CustomizeList(
                  image: "assets/images/img.jpg",
                  text: "Muhammed Seoudii",
                  text1: "muhammedsoudii@gmail.com",
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "My Account",
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color(0xff212121)),
                  child: Column(
                    children: [
                      CustomizeList1(
                        text: "Saved Items",
                        color: 0xffD50000,
                        icon: "heart",
                        size: 173,
                      ),
                      Divider(
                        color: Color(0xffE5E7EB),
                        thickness: 1.sp,
                        indent: 60,
                      ),
                      CustomizeList1(
                        text: "My Orders",
                        color: 0xffC6FF00,
                        icon: "order",
                        size: 188,
                      ),
                      Divider(
                        color: Color(0xffE5E7EB),
                        thickness: 1.sp,
                        indent: 60,
                      ),
                      CustomizeList1(
                        text: "Followed brands",
                        color: 0xffFF6F00,
                        icon: "brand",
                        size: 141,
                      ),
                      Divider(
                        color: Color(0xffE5E7EB),
                        thickness: 1.sp,
                        indent: 60,
                      ),
                      CustomizeList1(
                        text: "Shipping addresses",
                        color: 0xffE91E63,
                        icon: "location",
                        size: 119,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Reach Out",
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color(0xff212121)),
                  child: Column(
                    children: [
                      CustomizeList1(
                        text: "Terms and conditions",
                        color: 0xff2196F3,
                        icon: "terms",
                        size: 103,
                      ),
                      Divider(
                        color: Color(0xffE5E7EB),
                        thickness: 1.sp,
                        indent: 60,
                      ),
                      CustomizeList1(
                        text: "Contact us",
                        color: 0xffC6FF00,
                        icon: "call",
                        size: 184,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                // CustomizeButton2(
                //   OnClick: () {},
                //   text: " Sign out",
                //   color: Color(0xff424242),
                //   size: 16,
                //   color1: Color(0xff424242),
                //   icon: "logout",
                // ),
                // SizedBox(height: 20.h),
                // CustomizeButton2(
                //   OnClick: () {},
                //   text: " Delete Account",
                //   color: Color(0xffD50000),
                //   size: 16,
                //   color1: Color(0xffD50000),
                //   icon: "trash",
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
