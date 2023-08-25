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
  Future<void> saveTovarInHive(String code, int countTovar) async {
    registerAdapterHive();

    final basketBox = await Hive.openBox<TovarsForHive>('basket_box');
    await basketBox.put(
        code, TovarsForHive(code: code, countPerson: countTovar));

    basketBox.close();
  }

  @override
  Future<void> deleteTovarInHive() async {}

  @override
  Future<bool> checkTovarInHive() async {
    registerAdapterHive();
    bool availability = true;

    final basketBox = await Hive.openBox<TovarsForHive>('basket_box');
    if (basketBox.isEmpty) {
      availability = false;
    } else {
      availability = true;
    }
    basketBox.close();
    return availability;
  }
}

// регистрация адаптера
void registerAdapterHive() {
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(TovarsForHiveAdapter());
  }
}
