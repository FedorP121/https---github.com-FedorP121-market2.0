part of 'image_counter_bloc.dart';

abstract class ImageCounterState extends Equatable {}

class ImageCounterInitial extends ImageCounterState {
  final int index;
  ImageCounterInitial({
    required this.index,
  });
  @override
  List<Object?> get props => [index];
}

class ImageIndexState extends ImageCounterState {
  final int index;
  ImageIndexState({
    required this.index,
  });
  @override
  List<Object?> get props => [index];
}

class ImageIndexErrorState extends ImageCounterState {
  final Object error;
  ImageIndexErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
