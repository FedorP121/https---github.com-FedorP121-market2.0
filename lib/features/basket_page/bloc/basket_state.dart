// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'basket_bloc.dart';

abstract class BasketState extends Equatable {}

class BasketInitial extends BasketState {
  @override
  List<Object?> get props => [];
}

class LoadedTrueCheckBasketState extends BasketState {
  final bool availability;
  LoadedTrueCheckBasketState({
    required this.availability,
  });
  @override
  List<Object?> get props => [availability];
}

class ErrorBasketState extends BasketState {
  final Object error;
  ErrorBasketState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
