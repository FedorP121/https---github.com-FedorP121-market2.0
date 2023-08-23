// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tovars_category_bloc.dart';

abstract class TovarCategoryState extends Equatable {}

class TovarCategoryInitial extends TovarCategoryState {
  @override
  List<Object?> get props => [];
}

class TovarCategoryLoadingState extends TovarCategoryState {
  @override
  List<Object?> get props => [];
}

class TovarCategoryLoadedState extends TovarCategoryState {
  final List<Tovar> tovarsCategories;
  TovarCategoryLoadedState({
    required this.tovarsCategories,
  });
  @override
  List<Object?> get props => [tovarsCategories];
}

class TovarCategoryErrorState extends TovarCategoryState {
  final Object error;
  TovarCategoryErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
