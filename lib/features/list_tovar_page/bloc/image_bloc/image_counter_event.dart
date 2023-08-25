part of 'image_counter_bloc.dart';

abstract class ImageCounterEvent extends Equatable {}

class NextImageEvent extends ImageCounterEvent {
  final List<String> listImageUrl;
  NextImageEvent({
    required this.listImageUrl,
  });
  @override
  List<Object?> get props => [listImageUrl];
}

class BackImageEvent extends ImageCounterEvent {
  final List<String> listImageUrl;
  BackImageEvent({
    required this.listImageUrl,
  });
  @override
  List<Object?> get props => [listImageUrl];
}
