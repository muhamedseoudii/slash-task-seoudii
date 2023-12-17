import 'package:slash_new/models/product_property_and_value.dart';
import 'package:slash_new/models/product_variation.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final int brandId;
  final String? brandName;
  final String? brandLogoUrl;
  final double rating;
  final List<ProductVariation> variations;
  final List<ProductProperty> availableProperties;
  //t properties are offered //(multiple colors or non, multiple sizes or non, materials)

//<editor-fold desc="Data Methods">

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.brandId,
    this.brandName,
    this.brandLogoUrl,
    required this.rating,
    required this.variations,
    required this.availableProperties,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          brandId == other.brandId &&
          brandName == other.brandName &&
          brandLogoUrl == other.brandLogoUrl &&
          rating == other.rating &&
          variations == other.variations &&
          availableProperties == other.availableProperties);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      brandId.hashCode ^
      brandName.hashCode ^
      brandLogoUrl.hashCode ^
      rating.hashCode ^
      variations.hashCode ^
      availableProperties.hashCode;

  @override
  String toString() {
    return 'Product{ id: $id, name: $name, description: $description, brandId: $brandId, brandName: $brandName, brandLogoUrl: $brandLogoUrl, rating: $rating, variations: $variations, availableProperties: $availableProperties,}';
  }

  Product copyWith({
    int? id,
    String? name,
    String? description,
    int? brandId,
    String? brandName,
    String? brandLogoUrl,
    double? rating,
    List<ProductVariation>? variations,
    List<ProductProperty>? availableProperties,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      brandId: brandId ?? this.brandId,
      brandName: brandName ?? this.brandName,
      brandLogoUrl: brandLogoUrl ?? this.brandLogoUrl,
      rating: rating ?? this.rating,
      variations: variations ?? this.variations,
      availableProperties: availableProperties ?? this.availableProperties,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': this.id,
  //     'name': this.name,
  //     'description': this.description,
  //     'brandId': this.brandId,
  //     'brandName': this.brandName,
  //     'brandLogoUrl': this.brandLogoUrl,
  //     'rating': this.rating,
  //     'variations': this.variations,
  //     'availableProperties': this.availableProperties,
  //   };
  // }
  //
  // factory Product.fromMap(Map<String, dynamic> map) {
  //   return Product(
  //     id: map['id'] as int,
  //     name: map['name'] as String,
  //     description: map['description'] as String,
  //     brandId: map['brandId'] as int,
  //     brandName: map['brandName'] as String,
  //     brandLogoUrl: map['brandLogoUrl'] as String,
  //     rating: map['rating'] as double,
  //     variations: map['variations'] as List<ProductVariation>,
  //     availableProperties: map['availableProperties'] as List<ProductProperty>,
  //   );
  // }

  //</editor-fold>
}
