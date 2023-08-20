import 'package:equatable/equatable.dart';

class Tovars extends Equatable {
  final String code;
  final TovarDis tovar;
  const Tovars({
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
  final List<String> imageUrl;
  final String description;
  final Characteristics characteristics;
  const TovarDis({
    required this.name,
    required this.price,
    required this.maxCountTovar,
    required this.imageUrl,
    required this.description,
    required this.characteristics,
  });

  @override
  List<Object?> get props =>
      [name, price, maxCountTovar, imageUrl, description, characteristics];
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
