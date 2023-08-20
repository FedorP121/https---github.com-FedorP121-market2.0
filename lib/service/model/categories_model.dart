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
}

class Tovar extends Equatable {
  final String code;
  final String name;
  final double price;
  final int maxCountTovar;
  final List<String> imageUrl;
  final String description;
  final Characteristic characteristics;
  const Tovar({
    required this.code,
    required this.name,
    required this.price,
    required this.maxCountTovar,
    required this.imageUrl,
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
      description,
      characteristics,
    ];
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
}
