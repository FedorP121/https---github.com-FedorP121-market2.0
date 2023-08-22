import 'package:coin/material_app.dart';
import 'package:coin/service/export_working_with_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'repositories/bitrix_repository/export_abstract_bitrix.dart';
import 'repositories/hive_repository/export_abstract_hive.dart';
import 'repositories/shared_preferences_repository/export_abstract_shared_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  GetIt.I.registerLazySingleton<AbstractBitrixRepository>(
    () => BitrixRepository(dio: Dio()),
  );

  GetIt.I.registerLazySingleton<AbstractHiveRepository>(
    () => HiveRepository(hive: Hive),
  );

  GetIt.I.registerLazySingleton<AbstractWorkingWithData>(
    () => WorkingWithDataRepository(),
  );

  // Получение экземпляра SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();

  GetIt.I.registerLazySingleton<AbstractSharedPreferenceRepository>(
    () => SharedPreferencesRepository(prefs: prefs),
  );

  var app = const CryptoCurrencesListApp();
  runApp(app);
}
