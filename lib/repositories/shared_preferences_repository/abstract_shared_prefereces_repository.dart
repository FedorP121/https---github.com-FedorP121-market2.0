import 'package:coin/service/export_working_with_data.dart';

abstract class AbstractSharedPreferenceRepository {
  Future<void> saveTovarSharedPreference(List<Categories> listTovars);

  Future<List<Categories>> readTovarSharedPreference();
}
