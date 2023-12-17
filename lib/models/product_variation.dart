import 'package:slash_new/models/product_property_and_value.dart';

class ProductVariation {
  final int id;
  final int productId;
  final num price;
  final int quantity;
  final bool inStock; //to enable/disable addToCart button
  final List<String> productVariantImages;
  final List<ProductPropertyAndValue> productPropertiesValues;

//<editor-fold desc="Data Methods">
  const ProductVariation({
    required this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.inStock,
    required this.productVariantImages,
    required this.productPropertiesValues,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductVariation &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          productId == other.productId &&
          price == other.price &&
          quantity == other.quantity &&
          inStock == other.inStock &&
          productVariantImages == other.productVariantImages &&
          productPropertiesValues == other.productPropertiesValues);

  @override
  int get hashCode =>
      id.hashCode ^
      productId.hashCode ^
      price.hashCode ^
      quantity.hashCode ^
      inStock.hashCode ^
      productVariantImages.hashCode ^
      productPropertiesValues.hashCode;

  @override
  String toString() {
    return 'ProductVariation{ id: $id, productId: $productId, price: $price, quantity: $quantity, inStock: $inStock, productVarientImages: $productVariantImages, productPropertiesValues: $productPropertiesValues,}';
  }

  ProductVariation copyWith({
    int? id,
    int? productId,
    num? price,
    int? quantity,
    bool? inStock,
    List<String>? productVarientImages,
    List<ProductPropertyAndValue>? productPropertiesValues,
  }) {
    return ProductVariation(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      inStock: inStock ?? this.inStock,
      productVariantImages: productVarientImages ?? this.productVariantImages,
      productPropertiesValues:
          productPropertiesValues ?? this.productPropertiesValues,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': this.id,
  //     'productId': this.productId,
  //     'price': this.price,
  //     'quantity': this.quantity,
  //     'inStock': this.inStock,
  //     'productVarientImages': this.productVarientImages,
  //     'productPropertiesValues': this.productPropertiesValues,
  //   };
  // }
  //
  // factory ProductVariation.fromMap(Map<String, dynamic> map) {
  //   return ProductVariation(
  //     id: map['id'] as int,
  //     productId: map['productId'] as int,
  //     price: map['price'] as num,
  //     quantity: map['quantity'] as int,
  //     inStock: map['inStock'] as bool,
  //     productVarientImages: map['productVarientImages'] as List<String>,
  //     productPropertiesValues:
  //         map['productPropertiesValues'] as List<ProductPropertyAndValue>,
  //   );
  // }

//</editor-fold>
}
