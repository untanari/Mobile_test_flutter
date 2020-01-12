import 'dart:convert';

import 'package:mobile_test/model/house.dart';
import 'package:flutter/services.dart' show rootBundle;

class HouseProvider {
  static Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/sample.json');
  }

  static Future<Houses> get fetchHouses async {
    return Future<Houses>.delayed(Duration(milliseconds: 800), () async {
      try {
        var result = await loadAsset();
        var data = json.decode(result);
        var house = Houses.fromJson(data);
        return house;
      } catch (err) {
        throw err;
      }
    });
  }
}
