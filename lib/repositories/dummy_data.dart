import 'package:slash_new/models/product.dart';
import 'package:slash_new/models/product_property_and_value.dart';
import 'package:slash_new/models/product_variation.dart';

class DummyData {
  static ProductPropertyAndValue productPropertyAndValue1 =
      const ProductPropertyAndValue(
          property: ProductProperty.material, value: "Cotton");
  static ProductPropertyAndValue productPropertyAndValue11 =
      const ProductPropertyAndValue(
          property: ProductProperty.material, value: "Plastic");
  static ProductPropertyAndValue productPropertyAndValue2 =
      const ProductPropertyAndValue(
          property: ProductProperty.color, value: "ebc14a");
  static ProductPropertyAndValue productPropertyAndValue22 =
      const ProductPropertyAndValue(
          property: ProductProperty.color, value: "762f9c");
  static ProductPropertyAndValue productPropertyAndValue3 =
      const ProductPropertyAndValue(
          property: ProductProperty.size, value: "XL");
  static ProductPropertyAndValue productPropertyAndValue33 =
      const ProductPropertyAndValue(property: ProductProperty.size, value: "M");

  static Product p1 = Product(
    id: 1,
    name: "Oversized Rib-knit Sweater",
    description:
        "Collared bomber jacket featuring long sleeves. Front welt pockets. Elasticated hem. Front fastening with metal zip.",
    brandId: 1,
    brandName: "H&M",
    brandLogoUrl: "assets/icons/H&M.svg",
    rating: 4.5,
    variations: [
      ProductVariation(
        id: 1,
        productId: 1,
        price: 1200,
        quantity: 10,
        inStock: true,
        productVariantImages: [
          "assets/images/jacket4.jpg",
        ],
        productPropertiesValues: [
          productPropertyAndValue1,
          productPropertyAndValue2,
          productPropertyAndValue3,
        ],
      ),
      ProductVariation(
        id: 2,
        productId: 1,
        price: 1300,
        quantity: 50,
        inStock: true,
        productVariantImages: [
          "assets/images/h&mplover.jpeg",
        ],
        productPropertiesValues: [
          productPropertyAndValue11,
          productPropertyAndValue22,
          productPropertyAndValue33,
        ],
      ),
      // ProductVariation(
      //   id: 1,
      //   productId: 1,
      //   price: 1200,
      //   quantity: 10,
      //   inStock: true,
      //   productVariantImages: [
      //     "assets/images/h&mplover.jpeg",
      //   ],
      //   productPropertiesValues: [
      //     productPropertyAndValue1,
      //     productPropertyAndValue2,
      //   ],
      // ),
      // ProductVariation(
      //   id: 2,
      //   productId: 1,
      //   price: 10.0,
      //   quantity: 10,
      //   inStock: true,
      //   productVariantImages: [
      //     "assets/images/smalljacket3.jpg",
      //     "https://www.nike.com",
      //     "https://www.nike.com",
      //   ],
      //   productPropertiesValues: [
      //     productPropertyAndValue1,
      //     productPropertyAndValue2,
      //   ],
      // ),
    ],
    availableProperties: [
      ProductProperty.material,
      ProductProperty.color,
    ],
  );

  static Product p2 = Product(
    id: 2,
    name: "Shirt Bomber Jacket",
    description: "A nice Jacket",
    brandId: 1,
    brandName: "Zara",
    brandLogoUrl: "assets/icons/Zara.svg",
    rating: 4.5,
    variations: [
      ProductVariation(
        id: 1,
        productId: 1,
        price: 3000,
        quantity: 10,
        inStock: true,
        productVariantImages: [
          "assets/images/zaraJacket.jpg",
        ],
        productPropertiesValues: [
          productPropertyAndValue1,
          productPropertyAndValue2,
        ],
      ),
      ProductVariation(
        id: 1,
        productId: 1,
        price: 2200,
        quantity: 10,
        inStock: false,
        productVariantImages: [
          "assets/images/bershTshirt.jpg",
        ],
        productPropertiesValues: [
          productPropertyAndValue1,
          productPropertyAndValue2.copyWith(value: "6fe802"),
        ],
      ),
    ],
    availableProperties: [
      ProductProperty.material,
      ProductProperty.color,
    ],
  );

  static final List<Product> products = [p1, p2, p1];
}
