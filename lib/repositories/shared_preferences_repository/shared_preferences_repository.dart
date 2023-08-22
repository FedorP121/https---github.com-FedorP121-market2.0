import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:coin/service/export_working_with_data.dart';

import 'export_abstract_shared_preference.dart';

class SharedPreferencesRepository
    implements AbstractSharedPreferenceRepository {
  final SharedPreferences prefs;
  SharedPreferencesRepository({
    required this.prefs,
  });

  @override
  Future<void> saveTovarSharedPreference(List<Categories> listTovars) async {
    prefs.setString('shared_preferences', jsonEncode(listTovars));
  }

  @override
  Future<List<Categories>> readTovarSharedPreference() async {
    final prefData = prefs.getString('shared_preferences');
    List<Categories> listTovar = [];

    if (prefData != null) {
      List<dynamic> jsonList = jsonDecode(prefData);
      listTovar = jsonList.map((jsonItem) {
        return Categories.fromJson(jsonItem);
      }).toList();
    }

    return listTovar;
  }
}
