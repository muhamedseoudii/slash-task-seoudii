import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slash_new/models/product.dart';
import 'package:slash_new/models/product_property_and_value.dart';

class ProductDetailsView extends StatefulWidget {
  final Product product;

  const ProductDetailsView({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int currPage = 0;
  int selectedIndex = 0;
  int selectedIndex1 = 0;
  bool isExpanded = false;
  int count = 0;
  Color? selectedColor;
  int selectedVariationIndex = 0;

  void minus() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  void plus() {
    setState(() {
      if (count < 5) {
        count++;
      }
    });
  }

  void selectButton(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void selectButton1(int index) {
    setState(() {
      selectedIndex1 = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? controller;

  @override
  Widget build(BuildContext context) {
    var currentVariation = widget.product.variations[selectedVariationIndex];
    // final Set<ProductPropertyAndValue> colors = widget.product.variations
    //     .map((e) => e.productPropertiesValues
    //         .where((element) => element.property == ProductProperty.color))
    //     .toSet()
    //     .expand((element) => element)
    //     .toSet();
    // final Set<ProductPropertyAndValue> sizes = widget.product.variations
    //     .map((e) => e.productPropertiesValues
    //         .where((element) => element.property == ProductProperty.size))
    //     .toSet()
    //     .expand((element) => element)
    //     .toSet();
    // final Set<ProductPropertyAndValue> materials = widget.product.variations
    //     .map((e) => e.productPropertiesValues
    //         .where((element) => element.property == ProductProperty.material))
    //     .toSet()
    //     .expand((element) => element)
    //     .toSet();

    // ProductVariation? getVariationByProperties(
    //     Set<ProductPropertyAndValue> properties) {
    //   return widget.product.variations.firstWhere((element) {
    //     final Set<ProductPropertyAndValue> elementProperties =
    //         element.productPropertiesValues.toSet();
    //     return elementProperties.containsAll(properties) &&
    //         properties.containsAll(elementProperties);
    //   }, orElse: () => null);
    // }
    final Set<Color> colors = widget.product.variations
        .map((e) => e.productPropertiesValues
            .where((element) => element.property == ProductProperty.color))
        .toSet()
        .expand((element) => element)
        .map((e) => Color(int.parse('0xff${e.value}')))
        .toSet();

    final Set<String> sizes = widget.product.variations
        .map((e) => e.productPropertiesValues
            .where((element) => element.property == ProductProperty.size))
        .toSet()
        .expand((element) => element)
        .map((e) => e.value)
        .toSet();

    final Set<String> materials = widget.product.variations
        .map((e) => e.productPropertiesValues
            .where((element) => element.property == ProductProperty.material))
        .toSet()
        .expand((element) => element)
        .map((e) => e.value)
        .toSet();

    var product = widget.product;
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          tooltip: "Product Variations",
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => SizedBox(
                height: 200.h,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      "Product Variations for\n(${widget.product.name})",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xff000000),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 100.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.product.variations.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedVariationIndex = index;
                            });
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50.h,
                                  width: 50.w,
                                  child: Image.asset(
                                    widget.product.variations[index]
                                        .productVariantImages[0],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  "EGP ${widget.product.variations[index].price}",
                                  style: TextStyle(
                                      color: const Color(0xff000000),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Icon(Icons.style_outlined),
        );
      }),
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          "Product details",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 313.h,
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (value) {
                    currPage = value;
                    setState(() {});
                  },
                  children: List.generate(
                    currentVariation.productVariantImages.length,
                    (index) => Image.asset(
                      currentVariation.productVariantImages[index],
                      height: 100.h,
                      width: 300.w,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  currentVariation.productVariantImages.length,
                  (index) => Padding(
                    padding: const EdgeInsetsDirectional.only(end: 5),
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor:
                          Color(index == currPage ? 0xff76FF03 : 0xffFFFFFF),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                        color: const Color(0xffFFFFFF),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal),
                  ),
                  CircleAvatar(
                    radius: 25.r,
                    child: SvgPicture.asset(
                      product.brandLogoUrl!,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "EGP ${currentVariation.price}",
                    style: TextStyle(
                        color: const Color(0xffFFFFFF),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal),
                  ),
                  // SizedBox(width: 230.w),
                  Text(
                    product.brandName!,
                    style: TextStyle(
                        color: const Color(0xffFFFFFF),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              //colors
              SizedBox(
                height: 30.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedColor = Color(int.parse(
                                '0xff${colors.elementAt(index).value}'));
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            border: const Border.fromBorderSide(
                              BorderSide(color: Color(0xff424242), width: 2),
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Color(int.parse(
                                '0xff${colors.elementAt(index).value}')),
                            radius: 10,
                            foregroundColor: selectedColor ==
                                    Color(int.parse(
                                        '0xff${colors.elementAt(index).value}'))
                                ? Colors.white
                                : Colors.transparent,
                            child: selectedColor ==
                                    Color(int.parse(
                                        '0xff${colors.elementAt(index).value}'))
                                ? Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(200),
                                        border: const Border.fromBorderSide(
                                            BorderSide(
                                                color: Colors.red, width: 2))),
                                  )
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Size",
                    style: TextStyle(
                        color: const Color(0xffFFFFFF),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Select Chart",
                    style: TextStyle(
                        color: const Color(0xffFFFFFF),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    sizes.length,
                    (index) => ElevatedButton(
                      onPressed: () {
                        selectButton(index);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: selectedIndex == index
                            ? const Color(0xff76FF03)
                            : const Color(0xff424242),
                      ),
                      child: selectedIndex == index
                          ? Text(
                              sizes.elementAt(index),
                              style: const TextStyle(color: Colors.black),
                            )
                          : Text(sizes.elementAt(index),
                              style: const TextStyle(color: Colors.white)),
                    ),
                  ),

                  // ElevatedButton(
                  //   onPressed: () => selectButton(0),
                  //   style: ElevatedButton.styleFrom(
                  //     primary: selectedIndex == 0
                  //         ? const Color(0xff76FF03)
                  //         : const Color(0xff424242),
                  //   ),
                  //   child: selectedIndex == 0
                  //       ? const Text(
                  //           'M',
                  //           style: TextStyle(color: Colors.black),
                  //         )
                  //       : const Text('M',
                  //           style: TextStyle(color: Colors.white)),
                  // ),
                  // SizedBox(width: 5.w),
                  // ElevatedButton(
                  //   onPressed: () => selectButton(1),
                  //   style: ElevatedButton.styleFrom(
                  //     primary: selectedIndex == 1
                  //         ? const Color(0xff76FF03)
                  //         : const Color(0xff424242),
                  //   ),
                  //   child: selectedIndex == 1
                  //       ? const Text(
                  //           'L',
                  //           style: TextStyle(color: Colors.black),
                  //         )
                  //       : const Text('L',
                  //           style: TextStyle(color: Colors.white)),
                  // ),
                  // SizedBox(width: 5.w),
                  // ElevatedButton(
                  //   onPressed: () => selectButton(2),
                  //   style: ElevatedButton.styleFrom(
                  //     primary: selectedIndex == 2
                  //         ? const Color(0xff76FF03)
                  //         : const Color(0xff424242),
                  //   ),
                  //   child: selectedIndex == 2
                  //       ? const Text(
                  //           'XL',
                  //           style: TextStyle(color: Colors.black),
                  //         )
                  //       : const Text('XL',
                  //           style: TextStyle(color: Colors.white)),
                  // ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                "Select Material",
                style: TextStyle(
                    color: const Color(0xffFFFFFF),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    materials.length,
                    (index) => ElevatedButton(
                      onPressed: () {
                        selectButton1(index);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: selectedIndex1 == index
                            ? const Color(0xff76FF03)
                            : const Color(0xff424242),
                      ),
                      child: selectedIndex1 == index
                          ? Text(
                              materials.elementAt(index),
                              style: const TextStyle(color: Colors.black),
                            )
                          : Text(materials.elementAt(index),
                              style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () => selectButton1(0),
                  //   style: ElevatedButton.styleFrom(
                  //     primary: selectedIndex1 == 0
                  //         ? const Color(0xff76FF03)
                  //         : const Color(0xff424242),
                  //   ),
                  //   child: selectedIndex1 == 0
                  //       ? const Text(
                  //           'Leather',
                  //           style: TextStyle(color: Colors.black),
                  //         )
                  //       : const Text('Leather',
                  //           style: TextStyle(color: Colors.white)),
                  // ),
                  // SizedBox(width: 5.w),
                  // ElevatedButton(
                  //   onPressed: () => selectButton1(1),
                  //   style: ElevatedButton.styleFrom(
                  //     primary: selectedIndex1 == 1
                  //         ? const Color(0xff76FF03)
                  //         : const Color(0xff424242),
                  //   ),
                  //   child: selectedIndex1 == 1
                  //       ? const Text(
                  //           'Coton',
                  //           style: TextStyle(color: Colors.black),
                  //         )
                  //       : const Text('Coton',
                  //           style: TextStyle(color: Colors.white)),
                  // ),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: const Color(0xff424242)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ExpansionTile(
                    onExpansionChanged: (value) {
                      setState(() {
                        isExpanded = value;
                      });
                    },
                    title: const Text('Description',
                        style: TextStyle(color: Colors.white)),
                    trailing: IconTheme(
                      data: const IconThemeData(color: Colors.white),
                      child: Icon(
                        isExpanded ? Icons.expand_less : Icons.expand_more,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(product.description,
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    "Quantity",
                    style: TextStyle(
                        color: const Color(0xffFFFFFF),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(width: 20.w),
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.black,
                        border: const Border.fromBorderSide(
                            BorderSide(color: Colors.white, width: 1))),
                    child: IconButton(
                      onPressed: minus,
                      icon: const Icon(Icons.remove,
                          color: Colors.white, size: 15),
                    ),
                  ),
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.black,
                        border: const Border.fromBorderSide(
                            BorderSide(color: Colors.white, width: 1))),
                    child: Center(
                      child: Text("${count}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              decoration: TextDecoration.underline)),
                    ),
                  ),
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.black,
                        border: const Border.fromBorderSide(
                            BorderSide(color: Colors.white, width: 1))),
                    child: IconButton(
                      onPressed: plus,
                      icon:
                          const Icon(Icons.add, color: Colors.white, size: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SizedBox(
                  width: 360.w,
                  height: 40.h,
                  child: FilledButton(
                    onPressed: !currentVariation.inStock ? null : () {},
                    child: Text(
                        !currentVariation.inStock
                            ? 'Out of Stock'
                            : 'Add to Cart',
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: !currentVariation.inStock
                                ? Colors.white38
                                : Colors.black)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
