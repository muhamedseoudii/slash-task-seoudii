import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_new/component/listDesign/view.dart';
import 'package:slash_new/repositories/dummy_data.dart';
import 'package:slash_new/utils/helper_methods.dart';
import 'package:slash_new/views/productDetails/view.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x42000000),
        centerTitle: false,
        title: Text(
          textAlign: TextAlign.start,
          "Slash.",
          style: TextStyle(
              color: const Color(0xffFFFFFF),
              fontSize: 28.sp,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: const AssetImage(
              "assets/images/img.jpg",
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    "Brands",
                    style: TextStyle(
                        color: const Color(0xffFFFFFF),
                        fontSize: 22.sp,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    "See More",
                    style: TextStyle(
                        color: const Color(0xffE5E7EB),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 140.h,
                width: 500.w,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CustomListTile(
                      text: "Zara",
                      icon: "assets/icons/Zara.svg",
                    ),
                    SizedBox(width: 15.w),
                    CustomListTile(
                      text: "Pull&Bear",
                      icon: "assets/icons/Pull&Bear.svg",
                    ),
                    SizedBox(width: 15.w),
                    CustomListTile(
                      text: "Bershka",
                      icon: "assets/icons/Bershka.svg",
                    ),
                    SizedBox(width: 15.w),
                    CustomListTile(
                      text: "H&M",
                      icon: "assets/icons/H&M.svg",
                    ),
                    SizedBox(width: 15.w),
                    CustomListTile(
                      text: "Massimo Dutti",
                      icon: "assets/icons/Massimo_Dutti.svg",
                    ),
                    SizedBox(width: 15.w),
                    CustomListTile(
                      text: "Mango",
                      icon: "assets/icons/Mango.svg",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                textAlign: TextAlign.start,
                "Best Selling",
                style: TextStyle(
                    color: const Color(0xffFFFFFF),
                    fontSize: 22.sp,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 15.h),
              Center(
                child: Text(
                  "The list is empty at the moment",
                  style: TextStyle(
                      color: const Color(0xffE5E7EB),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(height: 35.h),
              Text(
                textAlign: TextAlign.start,
                "New Arrivals",
                style: TextStyle(
                    color: const Color(0xffFFFFFF),
                    fontSize: 22.sp,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 15.h),
              SizedBox(
                  height: 193.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: DummyData.products.length,
                    itemBuilder: (context, index) {
                      var product = DummyData.products[index];
                      return Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                navigateTo(
                                    context,
                                    ProductDetailsView(
                                      product: product,
                                    ));
                              },
                              child: CustomList(
                                text: product.name,
                                icon: product.brandLogoUrl!,
                                image: product
                                    .variations[0].productVariantImages[0],
                                text1: product.variations[0].price.toString(),
                                size: 0,
                              )),
                          SizedBox(width: 15.w),
                        ],
                      );
                    },
                  )

                  // ListView(
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         navigateTo(context, ProductDetailsView());
                  //       },
                  //       child: CustomList(
                  //           text: "Shirt Bomber Jacket",
                  //           icon: "assets/icons/Zara.svg",
                  //           image: "assets/images/zaraJacket.jpg",
                  //           text1: "EGP 2200",
                  //           size: 28),
                  //     ),
                  //     SizedBox(width: 15.w),
                  //     CustomList(
                  //         text: "Oversized Rib-knit Sweater",
                  //         icon: "assets/icons/H&M.svg",
                  //         image: "assets/images/h&mplover.jpeg",
                  //         text1: "EGP 2200",
                  //         size: 28),
                  //     SizedBox(width: 15.w),
                  //     CustomList(
                  //         text:
                  //             "DENNIS RODMAN X BERSHKA print short sleeve boxy-fit",
                  //         icon: "assets/icons/Bershka.svg",
                  //         image: "assets/images/bershTshirt.jpg",
                  //         text1: "EGP 1690",
                  //         size: 28),
                  //   ],
                  // ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
