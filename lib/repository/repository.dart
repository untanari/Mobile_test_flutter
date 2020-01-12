
import 'package:mobile_test/model/house.dart';

import 'house_provider.dart';

class Repository {
  //GET
  static Future<Houses> get getHouse => HouseProvider.fetchHouses;
}