import 'package:coin/service/export_working_with_data.dart';

abstract class AbstractSharedPreferenceRepository {
  Future<void> saveTovarShPref(List<Categories> listTovars);

  Future<List<Categories>> readTovarShPref();
}
