// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {}

class CategoryInitial extends CategoryState {
  @override
  List<Object?> get props => [];
}

class LoadingBitrixState extends CategoryState {
  @override
  List<Object?> get props => [];
}

class LoadedBitrixState extends CategoryState {
  final List<Categories> listTovars;
  LoadedBitrixState({
    required this.listTovars,
  });

  @override
  List<Object?> get props => [listTovars];
}

class ErrorBitrixState extends CategoryState {
  final Object? error;
  ErrorBitrixState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
