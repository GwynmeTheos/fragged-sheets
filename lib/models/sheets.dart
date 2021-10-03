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
  abstract String name;
  abstract SheetType type;

  /// Returns a Json string representation of the object.
  String get toJsonString;
  /// Returns a Map<String, dynamic> representation of the object.
  Map<String, dynamic> get toMap;

  static SheetModel builder({required Editions edition, required SheetType type, required String name}) {
    switch (edition) {
      case Editions.EMPIRE:
        return EmpireSheetModel(
          type: type,
          name: name
        );
      case Editions.AETERNUM:
        return AeternumSheetModel(
          type: type,
          name: name
        );
      default:
        return EmpireSheetModel(
          type: type,
          name: name
        );
    }
  }

}

class EmpireSheetModel extends SheetModel {
  Editions edition = Editions.EMPIRE;
  SheetType type;

  // Basic data
  String name;

  EmpireSheetModel({
    this.name: "",
    required this.type,
  });

  @override
  String get toJsonString {
    return "";
  }

  @override
  Map<String, dynamic> get toMap {
    return {};
  }
}

class AeternumSheetModel extends SheetModel {
  Editions edition = Editions.AETERNUM;
  SheetType type;

  // Basic data
  String name;

  AeternumSheetModel({
    this.name: "",
    required this.type,
  });

  @override
  String get toJsonString {
    return "";
  }

  @override
  Map<String, dynamic> get toMap {
    return {};
  }
}