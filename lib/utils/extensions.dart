import 'package:flutter/material.dart';
import 'package:fragged_sheets/models/models.dart';

/// Helper funcion to build the list of DropdownMenuItem from a list of Editions,
/// to be used on a DropdownMenuButton.
List<DropdownMenuItem<Editions>> editionListToDropdown(List<Editions> lisStr) {
  return lisStr.map<DropdownMenuItem<Editions>>(
    (Editions value) {
      return DropdownMenuItem<Editions>(
        value: value,
        child: Text(value.name)
      );
    }
  ).toList();
}