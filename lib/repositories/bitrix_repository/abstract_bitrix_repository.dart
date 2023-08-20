// В нем находится описание методов(название), что принимает и что возвращает
import 'models/models.dart';

abstract class AbstractBitrixRepository {
  Future<List<TovarsBitrix>> loadTovarFromBitrix();

  Future<List<Order>> loadOrderFromBitrix();
}
