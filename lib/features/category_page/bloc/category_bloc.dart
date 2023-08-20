// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:coin/repositories/bitrix_repository/export_abstract_bitrix.dart';
import 'package:coin/service/export_working_with_data.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final AbstractBitrixRepository bitrixRepository;
  final AbstractWorkingWithData abstractWorkingWithData;

  CategoryBloc(
    this.bitrixRepository,
    this.abstractWorkingWithData,
  ) : super(CategoryInitial()) {
    on<LoadingBitrixCategoryEvent>(_loadBitrixData);
  }

  void _loadBitrixData(
      LoadingBitrixCategoryEvent event, Emitter<CategoryState> emit) async {
    try {
      if (state is! LoadedBitrixState) {
        emit(LoadingBitrixState());
      }
      final listTovarsFromBitrix = await bitrixRepository.loadTovarFromBitrix();
      final listTovars =
          abstractWorkingWithData.sortTovarList(listTovarsFromBitrix);
      emit(LoadedBitrixState(listTovars: listTovars));
    } catch (error) {
      emit(ErrorBitrixState(error: error));
    }
  }
}
