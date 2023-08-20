// В нем находится описание методов(название), что принимает и что возвращает
import 'models/models.dart';

abstract class AbstractHiveRepository {
  Future<List<TovarsForHive>> loadTovarFromHive();

  Future<void> saveTovarFromHive(String code);

  Future<void> deleteTovarFromHive();
}
