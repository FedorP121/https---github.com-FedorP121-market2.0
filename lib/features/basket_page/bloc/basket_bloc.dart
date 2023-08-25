import 'package:equatable/equatable.dart';
import 'package:coin/repositories/hive_repository/export_abstract_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final AbstractHiveRepository abstractHiveRepository;
  BasketBloc(
    this.abstractHiveRepository,
  ) : super(BasketInitial()) {
    on<CheckTovarInHive>(_checkTovarInHive);
  }

  void _checkTovarInHive(
      CheckTovarInHive event, Emitter<BasketState> emit) async {
    try {
      final bool availability = await abstractHiveRepository.checkTovarInHive();
      emit(LoadedTrueCheckBasketState(availability: availability));
    } catch (error) {
      emit(ErrorBasketState(error: error));
    }
  }
}
