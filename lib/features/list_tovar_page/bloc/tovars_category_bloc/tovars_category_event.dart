// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tovars_category_bloc.dart';

abstract class TovarCategoryEvent extends Equatable {}

class ReadTovarCategoryEvent extends TovarCategoryEvent {
  final int categoryId;
  ReadTovarCategoryEvent({
    required this.categoryId,
  });

  @override
  List<Object?> get props => [];
}

class SaveTovarInBasketEvent extends TovarCategoryEvent {
  final String code;
  SaveTovarInBasketEvent({
    required this.code,
  });
  @override
  List<Object?> get props => [code];
}
