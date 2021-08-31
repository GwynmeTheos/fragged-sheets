import 'package:flutter/material.dart';
import 'package:fragged_sheets/widgets/widgets.dart';
import 'package:fragged_sheets/models/models.dart';


// ignore: must_be_immutable
class EmpireSheet extends StatefulWidget {
  SheetModel sheet;

  EmpireSheet({required this.sheet});

  _EmpireSheetState createState() => _EmpireSheetState();
}
class _EmpireSheetState extends State<EmpireSheet> {
  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}

/*
// ignore: must_be_immutable
class XSheet extends StatefulWidget {
  SheetModel sheet;

  XSheet({required this.sheet});

  _XSheetState createState() => _XSheetState();
}
class _XSheetState extends State<XSheet> {
  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}
*/