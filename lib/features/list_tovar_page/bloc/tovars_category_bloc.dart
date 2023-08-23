// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coin/repositories/shared_preferences_repository/export_abstract_shared_preference.dart';
import 'package:coin/service/export_working_with_data.dart';

part 'tovars_category_event.dart';
part 'tovars_category_state.dart';

class TovarsCategoryBloc extends Bloc<TovarCategoryEvent, TovarCategoryState> {
  final AbstractWorkingWithData abstractWorkingWithData;
  final AbstractSharedPreferenceRepository abstractSharedPreferenceRepository;
  TovarsCategoryBloc(
    this.abstractWorkingWithData,
    this.abstractSharedPreferenceRepository,
  ) : super(TovarCategoryInitial()) {
    on<ReadTovarCategoryEvent>(_readTovarCategory);
  }
  void _readTovarCategory(
      ReadTovarCategoryEvent event, Emitter<TovarCategoryState> emit) async {
    try {
      emit(TovarCategoryLoadingState());
      final List<Categories> listTovar =
          await abstractSharedPreferenceRepository.readTovarShPref();

      final List<Tovar> tovarsCategories =
          abstractWorkingWithData.sortTovarList(listTovar, event.categoryId);

      emit(TovarCategoryLoadedState(tovarsCategories: tovarsCategories));
    } catch (error) {
      emit(TovarCategoryErrorState(error: error));
    }
  }
}
