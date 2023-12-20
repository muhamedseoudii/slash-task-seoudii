import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomizeButton2 extends StatelessWidget {
  final String text, icon;
  final Color color, color1;
  final double size;
  var OnClick;

  CustomizeButton2(
      {Key? key,
      required this.text,
      required this.color,
      required this.size,
      required this.OnClick,
      required this.icon,
      required this.color1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 380.w,
      height: 50.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff212121)),
          onPressed: () {
            OnClick();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: color,
                  fontSize: size.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10.w),
              SvgPicture.asset(
                "assets/icons/${icon}.svg",
                fit: BoxFit.scaleDown,
                color: color1,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
