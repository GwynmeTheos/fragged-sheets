import 'package:flutter/material.dart';
import 'package:fragged_sheets/models/models.dart';
import 'package:fragged_sheets/widgets/widgets.dart';

class EmpireSheetPage {
  SheetModel sheetModel;
  
  EmpireSheetPage(this.sheetModel);

  // Controllers


  Widget get tabBarView {
    switch (this.sheetModel.type) {
      case SheetType.CHARACTER:
        return TabBarView(
          children: [
            _charAttributeTab,
            _charSkillTab,
            _charTraitTab,
            _charEquipmentTab,
            _charActionTab
          ]
        );
      case SheetType.EXTRA:
        return TabBarView(
          children: [
            _charAttributeTab,
            _charSkillTab,
            _charTraitTab,
            _charEquipmentTab,
            _charActionTab
          ]
        );
      case SheetType.GOONS:
        return TabBarView(
          children: [
            _charAttributeTab,
            _charSkillTab,
            _charTraitTab,
            _charEquipmentTab,
            _charActionTab
          ]
        );
      default:
        return TabBarView(
          children: [
            _charAttributeTab,
            _charSkillTab,
            _charTraitTab,
            _charEquipmentTab,
            _charActionTab
          ]
        );
    }
  }

  Widget get _charAttributeTab {
    return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      MediaQueryData mediaQueryData = MediaQuery.of(context);
      return ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.transparent,
                width: 0
              ),
              borderRadius: BorderRadius.circular(16)
            ),
            child: HorizontalBlock(
              title: "Text",
              content: Text(""),
            )
            
            // Column(
            //   children: [
            //     Container(
            //       padding: EdgeInsets.only(
            //         top: 10,
            //         bottom: 10
            //       ),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(16),
            //           topRight: Radius.circular(16)
            //         ),
            //         color: Colors.black
            //       ),
            //       child: Text(
            //         "Upcoming planned features",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: Container(
            //         decoration: BoxDecoration(
            //           border: Border.all(
            //             color: Colors.black,
            //             width: 1
            //           )
            //         ),
            //         child: ListView(),
            //       )
            //     ),
            //     Container(
            //       padding: EdgeInsets.only(
            //         top: 5,
            //         bottom: 5
            //       ),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.only(
            //           bottomLeft: Radius.circular(16),
            //           bottomRight: Radius.circular(16)
            //         ),
            //         color: Colors.black
            //       ),
            //     ),
            //   ],
            // )
          ),
        ],
      );
    });
  }

  Widget get _charSkillTab {
    return Text("Skills - Empire");
  }

  Widget get _charTraitTab {
    return Text("Traits - Empire");
  }

  Widget get _charEquipmentTab {
    return Text("Equipment - Empire");
  }

  Widget get _charActionTab {
    return Text("Actions - Empire");
  }
}

class AeternumSheetPage {
  SheetModel sheetModel;

  AeternumSheetPage(this.sheetModel);

  // Controllers


  Widget get tabBarView {
    return TabBarView(
      children: [
        _attributeTab,
        _skillTab,
        _traitTab,
        _equipmentTab,
        _actionTab
      ]
    );
  }

  Widget get _attributeTab {
    return Text("Attributes - Aeternum");
  }

  Widget get _skillTab {
    return Text("Skills - Aeternum");
  }

  Widget get _traitTab {
    return Text("Traits - Aeternum");
  }

  Widget get _equipmentTab {
    return Text("Equipment - Aeternum");
  }

  Widget get _actionTab {
    return Text("Actions - Aeternum");
  }
}


/*
Container(
  height: mediaQueryData.size.height * 0.6,
  width: mediaQueryData.size.width * 0.3,
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.transparent,
      width: 0
    ),
    borderRadius: BorderRadius.circular(16)
  ),
  child: Column(
    children: [
      Container(
        width: mediaQueryData.size.width * 0.3,
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16)
          ),
          color: Colors.black
        ),
        child: Text(
          "Upcoming planned features",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1
            )
          ),
          child: ListView(
            children: [
              ListTile(
                title: Text("Character sheets for all editions"),
              ),
              Divider(height: 1,),
              ListTile(
                title: Text("Extra sheets for all editions (that have them)"),
              ),
              Divider(height: 1,),
              ListTile(
                title: Text("Importing and exporting sheets from clipboard"),
              ),
              Divider(height: 1,),
              ListTile(
                title: Text("Importing and exporting sheets from file"),
              ),
              Divider(height: 1,),
              ListTile(
                title: Text("Not go crazy"),
              ),
              Divider(height: 1,),
              ListTile(
                title: Text("GM Goon Sheets"),
              ),
              Divider(height: 1,),
              ListTile(
                title: Text("Make sheet groups"),
              ),
              Divider(height: 1,),
              ListTile(
                title: Text("Make sheets and groups draggable"),
              ),
              Divider(height: 1,),
              ListTile(
                title: Text("Polish looks"),
              ),
              Divider(height: 1,),
            ]
          ),
        )
      ),
      Container(
        width: mediaQueryData.size.width * 0.3,
        padding: EdgeInsets.only(
          top: 5,
          bottom: 5
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16)
          ),
          color: Colors.black
        ),
      ),
    ],
  )
),
*/

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