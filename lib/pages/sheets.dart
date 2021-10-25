import 'package:flutter/material.dart';
import 'package:fragged_sheets/models/models.dart';
import 'package:fragged_sheets/widgets/widgets.dart';

class EmpireSheetPage {
  EmpireSheetModel sheetModel;
  late TextEditingController nameController;
  late TextEditingController playerController;
  late TextEditingController raceController;
  late TextEditingController languageController;

  late TextEditingController levelController;
  late TextEditingController maxResController;
  late TextEditingController curResController;
  late TextEditingController maxInfController;
  late TextEditingController curInfController;
  
  EmpireSheetPage(this.sheetModel){
    this.nameController = new TextEditingController(
      text: this.sheetModel.name
    );
    this.playerController = new TextEditingController(
      text: this.sheetModel.player
    );
    this.raceController = new TextEditingController(
      text: this.sheetModel.race
    );
    this.languageController = new TextEditingController(
      text: this.sheetModel.languages
    );

    this.levelController = new TextEditingController(
      text: this.sheetModel.level == null
        ? "0"
        : this.sheetModel.level.toString()
    );
    this.maxResController = new TextEditingController(
      text: this.sheetModel.maxResources == null
        ? "0"
        : this.sheetModel.maxResources.toString()
    );
    this.curResController = new TextEditingController(
      text: this.sheetModel.curResources == null
        ? "0"
        : this.sheetModel.curResources.toString()
    );
    this.maxInfController = new TextEditingController(
      text: this.sheetModel.maxInfluence == null
        ? "0"
        : this.sheetModel.maxInfluence.toString()
    );
    this.curInfController = new TextEditingController(
      text: this.sheetModel.curInfluence == null
        ? "0"
        : this.sheetModel.curInfluence.toString()
    );
  }

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
      Widget basicBlock = HorizontalBlock(
        title: "Basic",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: NamedTextField(
                text: "Name",
                nameSize: 75,
                fieldSize: mediaQueryData.size.width * 0.4,
                controller: this.nameController,
                onChanged: () {
                  setState(() {
                    this.sheetModel.name = this.nameController.text;
                    this.sheetModel.saved = false;
                  });
                }
              ),
            ),
            SizedBox(height: 12,),
            Container(
              child: NamedTextField(
                text: "Player",
                nameSize: 75,
                fieldSize: mediaQueryData.size.width * 0.4,
                controller: this.playerController,
                onChanged: () {
                  setState(() {
                    this.sheetModel.player = this.playerController.text;
                    this.sheetModel.saved = false;
                    
                  });
                }
              ),
            ),
            SizedBox(height: 12,),
            Container(
              child: NamedTextField(
                text: "Race",
                nameSize: 75,
                fieldSize: mediaQueryData.size.width * 0.4,
                controller: this.raceController,
                onChanged: () {
                  setState(() {
                    this.sheetModel.race = this.raceController.text;
                    this.sheetModel.saved = false;
                    
                  });
                }
              ),
            ),
            SizedBox(height: 12,),
            Container(
              child: NamedTextField(
                text: "Language",
                nameSize: 75,
                fieldSize: mediaQueryData.size.width * 0.4,
                controller: this.languageController,
                onChanged: () {
                  setState(() {
                  this.sheetModel.languages = this.languageController.text;
                    this.sheetModel.saved = false;
                    
                  });
                }
              ),
            ),
            SizedBox(height: 24,),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Tooltip(
                    message: "+1 per 3 sessions, 1 Trait per Lv",
                    child: Container(
                      width: 75,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.center,
                        child: Text(
                          "Level"
                        ),
                      )
                    ),
                  ),
                  SizedBox(width: 12,),
                  Container(
                    width: 35.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: this.levelController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(      
                          borderSide: BorderSide(color: Colors.black),   
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        contentPadding: EdgeInsets.all(5)
                      ),
                      onChanged: (String? text) {
                        setState(() {
                          this.sheetModel.level = int.parse(this.levelController.text);
                          
                        });
                      },
                      onFieldSubmitted: (String? text) {
                        setState(() {
                          this.sheetModel.level = int.parse(this.levelController.text);
                          
                        });
                      },
                      onEditingComplete: () {
                        setState(() {
                          this.sheetModel.level = int.parse(this.levelController.text);
                          
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 6,),
                  Container(
                    width: 15.0,
                    height: 35.0,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text("="),
                    )
                  ),
                  SizedBox(width: 6,),
                  Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: new BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black
                      )
                    ),
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        "${this.sheetModel.level ?? 0}"
                      ),
                    )
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 75,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: Text(
                        "Resources"
                      ),
                    )
                  ),
                  SizedBox(width: 12,),
                  Container(
                    width: 50,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: Text(
                        "Max"
                      ),
                    )
                  ),
                  SizedBox(width: 6,),
                  Container(
                    width: 60.0,
                    height: 35.0,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text("Lv. + 2 +"),
                    )
                  ),
                  SizedBox(width: 6,),
                  Container(
                    width: 35.0,
                    height: 35.0,
                    child: TextFormField( 
                      controller: this.maxResController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(      
                          borderSide: BorderSide(color: Colors.black),   
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        contentPadding: EdgeInsets.all(5)
                      ),
                      onChanged: (String? text) {
                        setState(() {
                          this.sheetModel.maxResources= int.parse(this.maxResController.text);
                          
                        });
                      },
                      onFieldSubmitted: (String? text) {
                        setState(() {
                          this.sheetModel.maxResources = int.parse(this.maxResController.text);
                          
                        });
                      },
                      onEditingComplete: () {
                        setState(() {
                          this.sheetModel.maxResources = int.parse(this.maxResController.text);
                          
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 6,),
                  Container(
                    width: 15.0,
                    height: 35.0,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text("="),
                    )
                  ),
                  SizedBox(width: 6,),
                  Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: new BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black
                      )
                    ),
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        "${2 + (this.sheetModel.level ?? 0) + (this.sheetModel.maxResources ?? 0)}"
                      ),
                    )
                  ),
                  Container(
                    width: 24,
                    alignment: Alignment.center,
                    child: Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey,
                    )
                  ),
                  Container(
                    width: 50,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: Text(
                        "Current"
                      ),
                    )
                  ),
                  SizedBox(width: 6,),
                  Container(
                    width: 35.0,
                    height: 35.0,
                    child: TextFormField( 
                      controller: this.curResController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: (this.sheetModel.curResources ?? 0) > 2 + (this.sheetModel.level ?? 0) + (this.sheetModel.maxResources ?? 0) 
                          ? Colors.red
                          : Colors.black
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(      
                          borderSide: BorderSide(color: Colors.black),   
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        contentPadding: EdgeInsets.all(5)
                      ),
                      onChanged: (String? text) {
                        setState(() {
                          this.sheetModel.curResources = int.parse(this.curResController.text);
                          
                        });
                      },
                      onFieldSubmitted: (String? text) {
                        setState(() {
                          this.sheetModel.curResources = int.parse(this.curResController.text);
                          
                        });
                      },
                      onEditingComplete: () {
                        setState(() {
                          this.sheetModel.curResources = int.parse(this.curResController.text);
                          
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 6,),
                  Container(
                    width: 15.0,
                    height: 35.0,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text("/"),
                    )
                  ),
                  SizedBox(width: 6,),
                  Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: new BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black
                      )
                    ),
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        "${2 + (this.sheetModel.level ?? 0) + (this.sheetModel.maxResources ?? 0)}"
                      ),
                    )
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 75,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: Text(
                        "Influence"
                      ),
                    )
                  ),
                  SizedBox(width: 12,),
                  Container(
                    width: 50,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: Text(
                        "Max"
                      ),
                    )
                  ),
                  SizedBox(width: 6,),
                  Container(
                    width: 60.0,
                    height: 35.0,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text("Lv. + 2 +"),
                    )
                  ),
                  SizedBox(width: 6,),
                  Container(
                    width: 35.0,
                    height: 35.0,
                    child: TextFormField( 
                      controller: this.maxInfController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(      
                          borderSide: BorderSide(color: Colors.black),   
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        contentPadding: EdgeInsets.all(5)
                      ),
                      onChanged: (String? text) {
                        setState(() {
                          this.sheetModel.maxInfluence= int.parse(this.maxInfController.text);
                          
                        });
                      },
                      onFieldSubmitted: (String? text) {
                        setState(() {
                          this.sheetModel.maxInfluence = int.parse(this.maxInfController.text);
                          
                        });
                      },
                      onEditingComplete: () {
                        setState(() {
                          this.sheetModel.maxInfluence = int.parse(this.maxInfController.text);
                          
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 6,),
                  Container(
                    width: 15.0,
                    height: 35.0,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text("="),
                    )
                  ),
                  SizedBox(width: 6,),
                  Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: new BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black
                      )
                    ),
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        "${2 + (this.sheetModel.level ?? 0) + (this.sheetModel.maxInfluence ?? 0)}"
                      ),
                    )
                  ),
                  Container(
                    width: 24,
                    alignment: Alignment.center,
                    child: Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey,
                    )
                  ),
                  Container(
                    width: 50,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: Text(
                        "Current"
                      ),
                    )
                  ),
                  SizedBox(width: 6,),
                  Container(
                    width: 35.0,
                    height: 35.0,
                    child: TextFormField( 
                      controller: this.curInfController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: (this.sheetModel.curInfluence ?? 0) > 2 + (this.sheetModel.level ?? 0) + (this.sheetModel.maxInfluence ?? 0) 
                          ? Colors.red
                          : Colors.black
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(      
                          borderSide: BorderSide(color: Colors.black),   
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        contentPadding: EdgeInsets.all(5)
                      ),
                      onChanged: (String? text) {
                        setState(() {
                          this.sheetModel.curInfluence = int.parse(this.curInfController.text);
                          
                        });
                      },
                      onFieldSubmitted: (String? text) {
                        setState(() {
                          this.sheetModel.curInfluence = int.parse(this.curInfController.text);
                          
                        });
                      },
                      onEditingComplete: () {
                        setState(() {
                          this.sheetModel.curInfluence = int.parse(this.curInfController.text);
                          
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 6,),
                  Container(
                    width: 15.0,
                    height: 35.0,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text("/"),
                    )
                  ),
                  SizedBox(width: 6,),
                  Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: new BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black
                      )
                    ),
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        "${2 + (this.sheetModel.level ?? 0) + (this.sheetModel.maxInfluence ?? 0)}"
                      ),
                    )
                  ),
                ],
              ),
            ),
          ]
        ),
      );

      Widget attributesBlock = HorizontalBlock(
        title: "Attributes",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

          ],
        )
      );

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
            child: basicBlock
          ),
          SizedBox(
            height: 24
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.transparent,
                width: 0
              ),
              borderRadius: BorderRadius.circular(16)
            ),
            child: attributesBlock
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
  AeternumSheetModel sheetModel;

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
// ignore: must_be_immutable
class XSheet extends StatefulWidget {
  SheetModel sheet;

  XSheet(this.sheet, {required this.onStateChanged});

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