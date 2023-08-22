// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:coin/repositories/bitrix_repository/export_abstract_bitrix.dart';
import 'package:coin/repositories/shared_preferences_repository/export_abstract_shared_preference.dart';
import 'package:coin/service/export_working_with_data.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final AbstractBitrixRepository bitrixRepository;
  final AbstractWorkingWithData abstractWorkingWithData;
  final AbstractSharedPreferenceRepository abstractSharedPreferenceRepository;

  CategoryBloc(
    this.bitrixRepository,
    this.abstractWorkingWithData,
    this.abstractSharedPreferenceRepository,
  ) : super(CategoryInitial()) {
    on<LoadingBitrixCategoryEvent>(_loadBitrixData);
  }

  void _loadBitrixData(
      LoadingBitrixCategoryEvent event, Emitter<CategoryState> emit) async {
    try {
      if (state is! LoadedBitrixState) {
        emit(LoadingBitrixState());
      }
      // считал из битрикса
      final listTovarsFromBitrix = await bitrixRepository.loadTovarFromBitrix();

      // преобразовал у добную модель
      final listTovars =
          abstractWorkingWithData.sortCategoryList(listTovarsFromBitrix);

      // записал в SharedPreference
      abstractSharedPreferenceRepository.saveTovarSharedPreference(listTovars);

      // считал с SharedPreference
      final tovarSharedPreference =
          await abstractSharedPreferenceRepository.readTovarSharedPreference();

      // создал проверку и обходной путь на случай ошибок SharedPreference
      if (tovarSharedPreference.isEmpty) {
        // загрузка данных из listTovars которую мы прямиком получили из сети
        return emit(LoadedBitrixState(listTovars: listTovars));
      } else {
        // загрузка данных из SharedPreference
        return emit(LoadedBitrixState(listTovars: tovarSharedPreference));
      }
    } catch (error) {
      emit(ErrorBitrixState(error: error));
    }
  }
}
