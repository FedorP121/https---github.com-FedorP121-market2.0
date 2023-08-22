import 'package:coin/repositories/bitrix_repository/export_abstract_bitrix.dart';

import 'export_working_with_data.dart';

abstract class AbstractWorkingWithData {
  List<Categories> sortCategoryList(List<TovarsBitrix> listTovarsFromBitrix);

  List<Tovar> sortTovarList(List<Categories> list, int categoryId);
}
