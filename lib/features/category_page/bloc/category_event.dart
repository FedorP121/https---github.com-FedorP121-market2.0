// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {}

class LoadingBitrixCategoryEvent extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

class SaveTovarInHiveEvent extends CategoryEvent {
  final String code;
  SaveTovarInHiveEvent({
    required this.code,
  });

  @override
  List<Object?> get props => [code];
}
