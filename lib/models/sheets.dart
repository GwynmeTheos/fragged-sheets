import 'package:flutter/material.dart';
import 'package:fragged_sheets/widgets/widgets.dart';

/// Enumerates the editions for using on the new sheet
/// selection screen.
enum Editions {
  EMPIRE,
  AETERNUM,
  KINGDOM,
  SEAS,
  DIESELPUNK,
  CYBERPUNK,
  EMPIRE_SECOND, // In-dev
}
extension EditionsExt on Editions {
  String get name {
    switch (this) {
      case Editions.EMPIRE:
        return "Fragged Empire";
      case Editions.AETERNUM:
        return "Fragged Aeternum";
      case Editions.KINGDOM:
        return "Fragged Kingdom";
      case Editions.SEAS:
        return "Fragged Seas";
      case Editions.DIESELPUNK:
        return "Fragged Dieselpunk";
      case Editions.CYBERPUNK:
        return "Fragged Cyberpunk";
      case Editions.EMPIRE_SECOND:
        return "Fragged Empire 2e";
      default:
        return "N/A";
    }
  }
  static List<Editions> get characterSheetList {
    return [
      Editions.EMPIRE,
      Editions.AETERNUM,
      Editions.KINGDOM,
      Editions.SEAS,
      Editions.DIESELPUNK,
      Editions.CYBERPUNK,
      Editions.EMPIRE_SECOND,
    ];
  }

  static List<Editions> get extraSheetList {
    return [
      Editions.EMPIRE,
      Editions.SEAS,
      Editions.EMPIRE_SECOND,
    ];
  }

  SheetModel sheet(SheetType type) {
    switch (this) {
      case Editions.EMPIRE:
        return EmpireSheetModel(type: type);
      // case Editions.AETERNUM:
      //   return "Fragged Aeternum";
      // case Editions.KINGDOM:
      //   return "Fragged Kingdom";
      // case Editions.SEAS:
      //   return "Fragged Seas";
      // case Editions.DIESELPUNK:
      //   return "Fragged Dieselpunk";
      // case Editions.CYBERPUNK:
      //   return "Fragged Cyberpunk";
      // case Editions.EMPIRE_SECOND:
      //   return "Fragged Empire 2e";
      default:
        return EmpireSheetModel(type: type);
    }
  }

  String get logoDark {
    switch (this) {
      case Editions.EMPIRE:
        return "assets/fragged_empire_white.png";
      case Editions.AETERNUM:
        return "assets/fragged_aeternum_white.png";
      case Editions.KINGDOM:
        return "assets/fragged_kingdom_white.png";
      case Editions.SEAS:
        return "assets/fragged_seas_white.png";
      default:
        return "assets/fragged_sheets_white.png";
    }
  }
  
  String get logoLight {
    switch (this) {
      case Editions.EMPIRE:
        return "assets/fragged_empire_black.png";
      case Editions.AETERNUM:
        return "assets/fragged_aeternum_black.png";
      case Editions.KINGDOM:
        return "assets/fragged_kingdom_black.png";
      case Editions.SEAS:
        return "assets/fragged_seas_black.png";
      default:
        return "assets/fragged_sheets_black.png";
    }
  }
}

enum SheetType {
  CHARACTER,
  EXTRA,
  GOONS, // In-dev
}
extension SheetTypesEx on SheetType{
  String get name {
    switch (this) {
      case SheetType.CHARACTER:
        return "Character";
      case SheetType.EXTRA:
        return "Extra";
      case SheetType.GOONS:
        return "Goons";
    }
  }

  IconData get icon {
    switch (this) {
      case SheetType.CHARACTER:
        return Icons.person;
      case SheetType.EXTRA:
        return Icons.two_wheeler;
      case SheetType.GOONS:
        return SheetIcons.enemy;
    }
  }
}

/// Abstract model for integration with the home page.
/// New sheets must inherit from this class and implement [toJsonString] and
/// [toMap] as overrides.
abstract class SheetModel {
  abstract Editions edition;
  abstract SheetType type;
  abstract String name;
  abstract String player;

  /// Sets the member variables based on a given map.
  void fromMap(Map<String, dynamic> data);
  /// Returns a Map<String, dynamic> representation of the object.
  Map<String, dynamic> get toMap;

  static SheetModel builder({required Editions edition, required SheetType type, required String name, Map<String, dynamic>? data}) {
    switch (edition) {
      case Editions.EMPIRE:
        return EmpireSheetModel(
          type: type,
          name: name,
          data: data
        );
      case Editions.AETERNUM:
        return AeternumSheetModel(
          type: type,
          name: name,
          data: data
        );
      default:
        return EmpireSheetModel(
          type: type,
          name: name,
          data: data
        );
    }
  }

}

class EmpireSheetModel extends SheetModel {
  Editions edition = Editions.EMPIRE;
  SheetType type;

  // Basic data
  String name;
  String player;
  String? race;
  String? languages = "Corp";

  int? level = 0;
  int? maxResources;
  int? curResources;
  int? maxInfluence;
  int? curInfluence;

  EmpireSheetModel({
    this.name: "",
    this.player: "",
    required this.type,
    Map<String, dynamic>? data
  }){
    if (data != null) {
      fromMap(data);
    }
  }

  @override
  void fromMap(Map<String, dynamic> data) {
    this.player = data['player'];
    this.race = data['race'];
    this.languages = data['languages'];
    this.level = data['level'];
    this.maxResources = data['maxResources'];
    this.curResources = data['curResources'];
    this.maxInfluence = data['maxInfluence'];
    this.curInfluence = data['curInfluence'];
  }

  @override
  Map<String, dynamic> get toMap {
    return <String, dynamic>{
      'edition': this.edition.name,
      'type': this.type.name,

      'name': this.name,
      'player': this.player,
      'race': this.race ?? "",
      'languages': this.languages ?? "",
      'level': this.level ?? 0,
      'maxResources': this.maxResources ?? 0,
      'curResources': this.curResources ?? 0,
      'maxInfluence': this.maxInfluence ?? 0,
      'curInfluence': this.curInfluence ?? 0,
    };
  }
}

class AeternumSheetModel extends SheetModel {
  Editions edition = Editions.AETERNUM;
  SheetType type;

  // Basic data
  String name;
  String player;

  AeternumSheetModel({
    this.name: "",
    this.player: "",
    required this.type,
    Map<String, dynamic>? data
  }){
    if (data != null) {
      fromMap(data);
    }
  }

  @override
  void fromMap(Map<String, dynamic> data) {
    print("");
  }

  @override
  Map<String, dynamic> get toMap {
    return {};
  }
}