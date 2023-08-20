// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';

import 'abstract_hive_repository.dart';
import 'models/models.dart';

class HiveRepository implements AbstractHiveRepository {
  final HiveInterface hive;
  HiveRepository({
    required this.hive,
  });
  @override
  Future<List<TovarsForHive>> loadTovarFromHive() async {
    final List<TovarsForHive> a = [];
    return a;
  }

  @override
  Future<void> saveTovarFromHive(String code) async {
    registerAdapterHive();

    final box = await Hive.openBox<TovarsForHive>('tovars_box');
    await box.put(code, TovarsForHive(code: code, countPerson: 4));
  }

  @override
  Future<void> deleteTovarFromHive() async {}
}

// регистрация адаптера
void registerAdapterHive() {
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(TovarsForHiveAdapter());
  }
}
