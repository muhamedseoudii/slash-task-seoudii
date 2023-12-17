enum ProductProperty { color, size, material }

class ProductPropertyAndValue {
  final ProductProperty property; //color, or size, or material
  final String value;

  // property is color, value may be: #008000(hex for Green)
//if property is size, value may be: XL
//<editor-fold desc="Data Methods">

  const ProductPropertyAndValue({
    required this.property,
    required this.value,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductPropertyAndValue &&
          runtimeType == other.runtimeType &&
          (property == other.property || value == other.value));

  @override
  int get hashCode => property.hashCode ^ value.hashCode;

  @override
  String toString() {
    return 'ProductPropertyAndValue{ property: $property, value: $value,}';
  }

  ProductPropertyAndValue copyWith({
    ProductProperty? property,
    String? value,
  }) {
    return ProductPropertyAndValue(
      property: property ?? this.property,
      value: value ?? this.value,
    );
  }

// Map<String, dynamic> toMap() {
//   return {
//     'property': property,
//     'value': value,
//   };
// }
//
// factory ProductPropertyAndValue.fromMap(Map<String, dynamic> map) {
//   return ProductPropertyAndValue(
//     property: map['property'] as ProductProperty,
//     value: map['value'] as String,
//   );
// }

//</editor-fold>
}
