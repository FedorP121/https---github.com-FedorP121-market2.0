import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'image_counter_event.dart';
part 'image_counter_state.dart';

class ImageCounterBloc extends Bloc<ImageCounterEvent, ImageCounterState> {
  ImageCounterBloc() : super(ImageIndexState(index: 0)) {
    on<NextImageEvent>(_nextImage);
    on<BackImageEvent>(_backImage);
  }

  void _nextImage(NextImageEvent event, Emitter<ImageCounterState> emit) async {
    try {
      final int currentIndex = (state as ImageIndexState).index;
      final int newIndex = (currentIndex + 1) % event.listImageUrl.length;
      emit(ImageIndexState(index: newIndex));
    } catch (error) {
      emit(ImageIndexErrorState(error: error));
    }
  }

  void _backImage(BackImageEvent event, Emitter<ImageCounterState> emit) async {
    try {
      final int currentIndex = (state as ImageIndexState).index;
      final int newIndex = (currentIndex - 1 + event.listImageUrl.length) %
          event.listImageUrl.length;
      emit(ImageIndexState(index: newIndex));
    } catch (error) {
      emit(ImageIndexErrorState(error: error));
    }
  }
}
