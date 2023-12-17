import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x42000000),
        centerTitle: false,
        title: Text(
          textAlign: TextAlign.start,
          "Slash.",
          style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 28.sp,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: AssetImage(
              "assets/images/img.jpg",
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                width: 350.w,
                height: 55.h,
                child: TextFormField(
                  onTap: () {
                    // navigateTo(context, HomeScreenView());
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Search by product name...",
                    labelStyle: TextStyle(
                        color: Color(0xff9CA3AF),
                        wordSpacing: 0.5,
                        fontSize: 14),
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    prefixIcon: Icon(Icons.search_outlined),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide:
                          BorderSide(color: Color(0xffD1D5DB), width: 3),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: BorderSide(color: Color(0xffFF472B)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide:
                          BorderSide(color: Color(0xffFF472B), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.r),
                      borderSide: BorderSide(color: Color(0xffD1D5DB)),
                      gapPadding: 5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
