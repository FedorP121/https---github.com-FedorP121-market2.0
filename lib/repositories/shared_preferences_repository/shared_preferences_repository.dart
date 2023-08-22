import 'package:shared_preferences/shared_preferences.dart';

import 'package:coin/service/export_working_with_data.dart';

import 'export_abstract_shared_preference.dart';

class SharedPreferencesRepository
    implements AbstractSharedPreferenceRepository {
  final SharedPreferences pref;
  SharedPreferencesRepository({
    required this.pref,
  });

  @override
  Future<void> saveTovarSharedPreference(List<Categories> listTovars) async {
    print(listTovars);

    // pref.
  }

  @override
  Future<void> loadTovarSharedPreference() async {}
}
