// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Categories extends Equatable {
  final int categoryId;
  final String categoryName;
  final List<Tovar> tovars;
  const Categories({
    required this.categoryId,
    required this.categoryName,
    required this.tovars,
  });

  @override
  List<Object> get props => [categoryId, categoryName, tovars];

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'categoryName': categoryName,
      'tovars': tovars.map((tovar) => tovar.toJson()).toList(),
    };
  }

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      categoryId: json['categoryId'],
      categoryName: json['categoryName'],
      tovars: List<Tovar>.from(json['tovars'].map((x) => Tovar.fromJson(x))),
    );
  }
}

class Tovar extends Equatable {
  final String code;
  final String name;
  final double price;
  final int maxCountTovar;
  final String imageUrl;
  final List<String> listImageUrl;
  final String description;
  final Characteristic characteristics;
  const Tovar({
    required this.code,
    required this.name,
    required this.price,
    required this.maxCountTovar,
    required this.imageUrl,
    required this.listImageUrl,
    required this.description,
    required this.characteristics,
  });

  @override
  List<Object> get props {
    return [
      code,
      name,
      price,
      maxCountTovar,
      imageUrl,
      listImageUrl,
      description,
      characteristics,
    ];
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'maxCountTovar': maxCountTovar,
      'listImageUrl': listImageUrl,
      'description': description,
      'characteristics': characteristics.toJson(),
    };
  }

  factory Tovar.fromJson(Map<String, dynamic> json) {
    return Tovar(
      code: json['code'],
      name: json['name'],
      price: json['price'],
      maxCountTovar: json['maxCountTovar'],
      imageUrl: json['imageUrl'],
      listImageUrl: List<String>.from(json['listImageUrl']),
      description: json['description'],
      characteristics: Characteristic.fromJson(json['characteristics']),
    );
  }
}

class Characteristic extends Equatable {
  final int width;
  final int height;
  final int diagonal;
  const Characteristic({
    required this.width,
    required this.height,
    required this.diagonal,
  });

  @override
  List<Object?> get props => [width, height, diagonal];

  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
      'diagonal': diagonal,
    };
  }

  factory Characteristic.fromJson(Map<String, dynamic> json) {
    return Characteristic(
      width: json['width'],
      height: json['height'],
      diagonal: json['diagonal'],
    );
  }
}
