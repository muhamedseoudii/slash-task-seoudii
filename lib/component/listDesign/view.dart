import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomizeList extends StatelessWidget {
  final String text, image, text1;

  CustomizeList(
      {Key? key, required this.text, required this.image, required this.text1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: const Color(0xff212121)),
      child: ListTile(
        style: ListTileStyle.list,
        leading: Image.asset(image, fit: BoxFit.scaleDown),
        title:
            Text(text, style: TextStyle(color: Colors.white, fontSize: 15.sp)),
        subtitle:
            Text(text1, style: TextStyle(color: Colors.white, fontSize: 12.sp)),
        trailing: const Icon(Icons.arrow_forward_ios_outlined,
            color: Color(0xff424242)),
      ),
    ));
  }
}

class CustomizeList1 extends StatelessWidget {
  final String text, icon;
  int color, size;

  CustomizeList1(
      {Key? key,
      required this.text,
      required this.icon,
      required this.color,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // navigateTo(context, EditProfileView());
              },
              child: Container(
                width: 330.w,
                height: 60.h,
                color: const Color(0xff212121),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/${icon}.svg",
                      fit: BoxFit.scaleDown,
                      color: Color(color),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        wordSpacing: 1,
                      ),
                    ),
                    SizedBox(width: size.w),
                    const Icon(Icons.arrow_forward_ios_outlined,
                        color: Color(0xff424242)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String text, icon;

  // int color, size;

  CustomListTile({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.r,
            child: SvgPicture.asset(icon, fit: BoxFit.scaleDown),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
              fontWeight: FontWeight.normal,
              wordSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomList extends StatefulWidget {
  final String text, text1, icon, image;
  bool isSelected;
  bool isSelected1;
  double size;

  CustomList(
      {Key? key,
      required this.text,
      required this.icon,
      required this.image,
      required this.text1,
      required this.size,
      this.isSelected = false,
      this.isSelected1 = false})
      : super(key: key);

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 132.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100.h,
            width: 120.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: const Color(0xffE5E7EB)),
            child: Image.asset(widget.image, fit: BoxFit.contain),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    overflow: TextOverflow.ellipsis,
                    wordSpacing: 1,
                  ),
                ),
              ),
              SizedBox(width: 18.w),
              CircleAvatar(
                radius: 11.r,
                child: SvgPicture.asset(widget.icon, fit: BoxFit.scaleDown),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text1,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  overflow: TextOverflow.ellipsis,
                  wordSpacing: 1,
                ),
              ),
              SizedBox(
                width: 50.w,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        widget.isSelected = !widget.isSelected;
                        setState(() {});
                      },
                      child: widget.isSelected
                          ? SvgPicture.asset(
                              "assets/icons/heart.svg",
                              fit: BoxFit.scaleDown,
                              color: const Color(0xffD50000),
                            )
                          : SvgPicture.asset("assets/icons/heart.svg",
                              fit: BoxFit.scaleDown,
                              color: const Color(0xffE5E7EB)),
                    ),
                    SizedBox(width: 5.sp),
                    GestureDetector(
                      onTap: () {
                        widget.isSelected1 = !widget.isSelected1;
                        setState(() {});
                      },
                      child: widget.isSelected1
                          ? SvgPicture.asset("assets/icons/shopping-cart.svg",
                              fit: BoxFit.scaleDown,
                              color: Theme.of(context).primaryColor)
                          : SvgPicture.asset(
                              "assets/icons/shopping-cart.svg",
                              fit: BoxFit.scaleDown,
                              color: const Color(0xffE5E7EB),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
