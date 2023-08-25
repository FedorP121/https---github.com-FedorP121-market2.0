// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TovarsBitrix extends Equatable {
  final int categoryId;
  final String categoryName;
  final String code;
  final TovarDis tovar;
  const TovarsBitrix({
    required this.categoryId,
    required this.categoryName,
    required this.code,
    required this.tovar,
  });

  @override
  List<Object?> get props => [code, tovar];
}

class TovarDis extends Equatable {
  final String name;
  final double price;
  final int maxCountTovar;
  final String imageUrl;
  final List<String> listImageUrl;
  final String description;
  final Characteristics characteristics;
  const TovarDis({
    required this.name,
    required this.price,
    required this.maxCountTovar,
    required this.imageUrl,
    required this.listImageUrl,
    required this.description,
    required this.characteristics,
  });

  @override
  List<Object?> get props => [
        name,
        price,
        maxCountTovar,
        imageUrl,
        listImageUrl,
        description,
        characteristics
      ];
}

class Characteristics extends Equatable {
  final int width;
  final int height;
  final int diagonal;
  const Characteristics({
    required this.width,
    required this.height,
    required this.diagonal,
  });

  @override
  List<Object?> get props => [width, height, diagonal];
}
