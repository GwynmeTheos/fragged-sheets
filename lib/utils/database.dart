import 'dart:async';
import 'dart:convert';
import 'package:cross_file/cross_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';

import 'package:fragged_sheets/models/models.dart';

class StorageHelper {
  static Future<void> setAllSheets(List<SheetModel> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('sheets', SheetModel.pathStrings(data));
  }

  static Future<List<SheetModel>> getAllSheets() async {
    List<SheetModel> retList = List.empty(growable: true);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonStr = prefs.getString('sheets') ?? "[]";
    List<dynamic> decoded = jsonDecode(jsonStr);

    Map<String, dynamic> fileJson;
    for (int i = 0; i < decoded.length; i++) {
      fileJson = jsonDecode(await XFile(decoded[i]).readAsString());
      retList.add(
        SheetModel.builder(
          edition: fileJson['edition'],
          type: fileJson['type'],
          name: fileJson['name'],
          data: fileJson
        )
      );
    }

    return retList;
  }
}