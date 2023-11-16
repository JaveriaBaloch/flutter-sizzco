import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sizzco/Models/products_model.dart';

class StorageHelper {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<void> writeToFile(
      String filename, List<WooCommerceProduct> data) async {
    final file = await _getLocalFile(filename);

    final jsonData = data.map((item) => item.toJson()).toList();
    final jsonString = json.encode(jsonData);

    await file.writeAsString(jsonString);
  }

  Future<List<WooCommerceProduct>> readFromFile(String filename) async {
    final file = await _getLocalFile(filename);

    if (!file.existsSync()) {
      return []; // or another default value
    }

    final jsonString = await file.readAsString();
    final jsonData = json.decode(jsonString) as List<dynamic>;
    final dataList = jsonData
        .map(
            (item) => WooCommerceProduct.fromJson(item as Map<String, dynamic>))
        .toList();

    return dataList.cast<WooCommerceProduct>();
  }

  static Future<File> _getLocalFile(String filename) async {
    final localPath = await _localPath;
    return File('$localPath/$filename');
  }
}
