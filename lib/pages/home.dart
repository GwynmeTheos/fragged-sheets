import 'package:flutter/material.dart';
import 'package:fragged_sheets/pages/sheets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fragged_sheets/widgets/widgets.dart';
import 'package:fragged_sheets/models/models.dart';
import 'package:fragged_sheets/utils/utils.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);


  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  SheetModel? activeSheet;
  int? activeSheetIndex;

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
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: SizedBox.expand(
        child: Row(
          children: [
            SizedBox(
              width: mediaQueryData.size.width * 0.2,
              child: Sidebar(
                activeSheet: this.activeSheet,
                onStateChanged: () {
                  setState(() {
                    print("Redrawn");
                  });
                },
                onActiveSheetChanged: (sheet, index) {
                  setState(() {
                    this.activeSheet = sheet;
                    this.activeSheetIndex = index;
                    print("Redrawn");
                  });
                },
              )
            ),
            SizedBox(
              width: mediaQueryData.size.width * 0.8,
              child: SheetCanvas(
                sheet: this.activeSheet
              )
            )
          ],
        )
      )
    );
  }
}

class Sidebar extends StatefulWidget {
  final void Function() onStateChanged;
  final void Function(SheetModel?, int) onActiveSheetChanged;
  final int activeSheetIndex;
  final SheetModel? activeSheet;

  Sidebar({
    required this.onStateChanged,
    required this.onActiveSheetChanged,
    this.activeSheetIndex: -1,
    this.activeSheet});

  _SidebarState createState() => _SidebarState();
}
class _SidebarState extends State<Sidebar> {
  late List<SheetModel> sheets;
  late int activeSheetIndex;

  Editions? newCharacterEdition = EditionsExt.characterSheetList[0];
  Editions? newExtraEdition = EditionsExt.extraSheetList[0];
  TextEditingController newSheetName = TextEditingController();

  @override
  void initState(){
    super.initState();

    this.activeSheetIndex = widget.activeSheetIndex;

    this.sheets = List<SheetModel>.empty(growable: true);

    this.sheets.add(
      EmpireSheetModel(name: "Hello", type: SheetType.CHARACTER)
    );
    this.sheets.add(
      AeternumSheetModel(name: "World", type: SheetType.CHARACTER)
    );
  }

  @override
  void dispose(){
    super.dispose();
  }

  Future<SheetModel?> showNewCharacterAlert(BuildContext context) async {
    return showDialog<SheetModel?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            )
          ),
          contentPadding: EdgeInsets.all(0.0),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)
                        ),
                        color: Colors.black
                      ),
                      child: Text(
                        "Create new character",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButton<Editions>(
                            value: this.newCharacterEdition ?? EditionsExt.characterSheetList[0],
                            items: editionListToDropdown(EditionsExt.characterSheetList),
                            style: TextStyle(
                              color: Colors.black
                            ),
                            underline: Container(
                              color: Colors.black
                            ),
                            onChanged: (Editions? newValue) {
                              if (newValue != null){
                                setState(() {
                                  this.newCharacterEdition = newValue;
                                });
                              }
                            },
                          ),
                          TextField(
                            onChanged: (value) {},
                            controller: this.newSheetName,
                            decoration: InputDecoration(
                              hintText: "Name",        
                              enabledBorder: UnderlineInputBorder(      
                                borderSide: BorderSide(color: Colors.black),   
                              ),  
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            )
                          ),
                        ],
                      )
                    ),
                    Divider(
                      height: 1,
                      color: Colors.black
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Container(
                              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(32.0),
                                ),
                              ),
                              child: Text(
                                "Create",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              if (this.newCharacterEdition != null) {
                                Navigator.of(context).pop(
                                  SheetModel.builder(
                                    edition: this.newCharacterEdition!,
                                    type: SheetType.CHARACTER,
                                    name: this.newSheetName.text == ""
                                      ? "New character"
                                      : this.newSheetName.text
                                  )
                                );
                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            child: Container(
                              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(16.0)
                                ),
                              ),
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () => Navigator.of(context).pop(null)
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          )
        );
      }
    );
  }
  
  Future<SheetModel?> showNewExtraAlert(BuildContext context) async {
    
    return showDialog<SheetModel?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            )
          ),
          contentPadding: EdgeInsets.all(0.0),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)
                        ),
                        color: Colors.black
                      ),
                      child: Text(
                        "Create new extra",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButton<Editions>(
                            value: this.newExtraEdition ?? EditionsExt.extraSheetList[0],
                            items: editionListToDropdown(EditionsExt.extraSheetList),
                            style: TextStyle(
                              color: Colors.black
                            ),
                            underline: Container(
                              color: Colors.black
                            ),
                            onChanged: (Editions? newValue) {
                              if (newValue != null){
                                setState(() {
                                  this.newExtraEdition = newValue;
                                });
                              }
                            },
                          ),
                          TextField(
                            onChanged: (value) {},
                            controller: this.newSheetName,
                            decoration: InputDecoration(
                              hintText: "Name",        
                              enabledBorder: UnderlineInputBorder(      
                                borderSide: BorderSide(color: Colors.black),   
                              ),  
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            )
                          ),
                        ],
                      )
                    ),
                    Divider(
                      height: 1,
                      color: Colors.black
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Container(
                              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(32.0),
                                ),
                              ),
                              child: Text(
                                "Create",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              if (this.newExtraEdition != null) {
                                Navigator.of(context).pop(
                                  SheetModel.builder(
                                    edition: this.newExtraEdition!,
                                    type: SheetType.EXTRA,
                                    name: this.newSheetName.text == ""
                                      ? "New character"
                                      : this.newSheetName.text
                                  )
                                );
                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            child: Container(
                              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(16.0)
                                ),
                              ),
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () => Navigator.of(context).pop(null)
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          )
        );
      }
    );
  }
  
  Future<SheetModel?> showNewGoonAlert(BuildContext context) async {
    return await showDialog<SheetModel?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            )
          ),
          contentPadding: EdgeInsets.all(0.0),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)
                    ),
                    color: Colors.black
                  ),
                  child: Text(
                    "Create new goon",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text("Coming soon"),
                ),
                Divider(
                  height: 1,
                  color: Colors.black
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                            ),
                          ),
                          child: Text(
                            "Create",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () {
                          return ;
                        },
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16.0)
                            ),
                          ),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () => Navigator.of(context).pop(null)
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }

  Future<SheetModel?> showImportSheetAlert(BuildContext context) async {
    return await showDialog<SheetModel?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            )
          ),
          contentPadding: EdgeInsets.all(0.0),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)
                    ),
                    color: Colors.black
                  ),
                  child: Text(
                    "Import sheet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text("Coming soon"),
                ),
                Divider(
                  height: 1,
                  color: Colors.black
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                            ),
                          ),
                          child: Text(
                            "Create",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () {
                          return ;
                        },
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16.0)
                            ),
                          ),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () => Navigator.of(context).pop(null)
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
  
  List<Widget> getSidebarContent(BuildContext context) {
    List<Widget> content = List<Widget>.empty(growable: true);

    // Logo
    content.add(
      Image.asset(
          widget.activeSheet == null
            ? "assets/fragged_sheets_black.png"
            : widget.activeSheet!.edition.logoLight
        ),
    );
    content.add(ConstWidgets.sectionDivider);

    // Home
    content.add(
      Material(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: Text("Home"),
          onTap: () async {
            setState(() {
              widget.onActiveSheetChanged(null, this.activeSheetIndex);
              this.activeSheetIndex = -1;
            });
          },
        ),
      )
    );
    content.add(ConstWidgets.itemDivider);

    // Character
    content.add(
      Material(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          leading: Icon(
            Icons.person,
            color: Colors.black,
          ),
          title: Text("New character"),
          onTap: () async {
            SheetModel? newSheet = await showNewCharacterAlert(context);
            if (newSheet != null) {
              setState(() {
                this.sheets.add(newSheet);
              });
            }
          },
        ),
      )
    );
    content.add(ConstWidgets.itemDivider);

    // Extras
    content.add(
      Material(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          leading: Icon(
            Icons.two_wheeler,
            color: Colors.black,
          ),
          title: Text("New extra"),
          onTap: () async {
            SheetModel? newSheet = await showNewExtraAlert(context);
            if (newSheet != null) {
              setState(() {
                this.sheets.add(newSheet);
              });
            }
          },
        ),
      )
    );
    content.add(ConstWidgets.itemDivider);

    // Goons
    content.add(
      Material(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          leading: Icon(
            SheetIcons.enemy,
            color: Colors.black,
          ),
          title: Text("New goon"),
          onTap: () async {
            SheetModel? newSheet = await showNewGoonAlert(context);
            if (newSheet != null) {
              setState(() {
                this.sheets.add(newSheet);
              });
            }
          },
        ),
      )
    );
    content.add(ConstWidgets.itemDivider);

    // Import
    content.add(
      Material(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          leading: Icon(
            Icons.publish,
            color: Colors.black,
          ),
          title: Text("Import sheet"),
          onTap: () async {
            SheetModel? newSheet = await showImportSheetAlert(context);
            if (newSheet != null) {this.sheets.add(newSheet);}
          },
        ),
      )
    );
    content.add(ConstWidgets.sectionDivider);

    for (int i = 0; i < this.sheets.length; i++){
      content.add(
        Material(
          borderRadius: BorderRadius.circular(10),
          color: this.activeSheetIndex == i
            ? Colors.grey.shade300
            : Colors.grey.shade50,
          child: ListTile(
            leading: Icon(
              this.sheets[i].type.icon,
              color: Colors.black,
            ),
            title: Text(this.sheets[i].name),
            onTap: (){
              setState(() {
                widget.onActiveSheetChanged(this.sheets[i], this.activeSheetIndex);
                this.activeSheetIndex = i;
                print("Redrawn");
              });
            },
          ),
        )
      );
      content.add(
        Divider(
          height: 5,
          color: i == this.sheets.length-1 ? Colors.white : Colors.grey.shade200,
        ),
      );
    }
    if (this.sheets.length > 0) {content.add(ConstWidgets.sectionDivider);}
    

    // Github
    content.add(
      Material(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          leading: Icon(
            Logos.github,
            color: Colors.black,
          ),
          title: Text("Github repo"),
          onTap: () async {
            await launch("https://github.com/GwynmeTheos/fragged-sheets");
          },
        ),
      )
    );
    content.add(ConstWidgets.itemDivider);

    // Discord
    content.add(
      Material(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          leading: Icon(
            Logos.discord,
            color: Colors.black,
          ),
          title: Text("Discord"),
          onTap: () async {
            await launch("https://discord.com/invite/Z6Erwyc");
          },
        ),
      )
    );
    content.add(ConstWidgets.itemDivider);

    // Website
    content.add(
      Material(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          leading: Icon(
            Logos.fragged,
            color: Colors.black,
          ),
          title: Text("Website"),
          onTap: () async {
            await launch("http://fraggedempire.com/");
          },
        ),
      )
    );

    return content;
  }

  @override
  Widget build(BuildContext context) {
    // MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Material(
      elevation: 20,
      child: Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 5,
          right: 5,
          bottom: 20
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.zero,
          color: Colors.grey.shade50,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade900,
              offset: Offset(0.0, 2.0), //(x,y)
              blurRadius: 6.0,
            ),
          ]
        ),
        child: ListView(
          children: getSidebarContent(context),
        ),
      )
    );
  }
}

class SheetCanvas extends StatefulWidget {
  final SheetModel? sheet;

  SheetCanvas({required this.sheet});

  _SheetCanvasState createState() => _SheetCanvasState();
}
class _SheetCanvasState extends State<SheetCanvas>{
  Widget get tabBarView {
    // This will only ever run if widget.sheet is not null, so there is no 
    // risk regarding the null safety ignore operators here.
    switch (widget.sheet!.edition) {
      case Editions.EMPIRE:
        EmpireSheetPage sheetPage = new EmpireSheetPage(widget.sheet!);
        return sheetPage.tabBarView;
      case (Editions.AETERNUM):
        AeternumSheetPage sheetPage = new AeternumSheetPage(widget.sheet!);
        return sheetPage.tabBarView;
      // case :
        
      // case :
        
      // case :
        
      default:
        return Align(
          alignment: Alignment.center,
          child: Text(
            "Woops! Something went wrong.",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold
            ),
          ),
        );
    }
  }

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
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    Widget sheetCanvas;
    if (widget.sheet == null) {
      sheetCanvas = Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
          ),
          actions: [],
        ),
        body: SizedBox.expand(
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
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
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Thank you for using Fragged Sheets."+ 
                    "\nFragged Sheets was made by Leonardo Dias."+
                    "\nFragged Empire, Aeternum, Seas, Kingdom, etc are owned by Design Ministries and Wade Dyer.\n",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12
                    ),
                  ),
                )
              ],
            )
          ),
        ),
      );
    } else {
      sheetCanvas = DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            title: Text(
              widget.sheet!.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
            ),
            actions: [
              Container(
                padding: EdgeInsets.only(
                  right: mediaQueryData.size.width * 0.02
                ),
                child: IconButton(
                  onPressed: (){
                    print("Boop");
                  },
                  icon: Icon(
                    Icons.download,
                    color: Colors.white
                  )
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  right: mediaQueryData.size.width * 0.02
                ),
                child: IconButton(
                  onPressed: (){
                    print("Boop");
                  },
                  icon: Icon(
                    Icons.download,
                    color: Colors.white
                  )
                ),
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(text: "Attributes",),
                Tab(text: "Skills",),
                Tab(text: "Traits",),
                Tab(text: "Equipment",),
                Tab(text: "Actions",),
              ],
            ),
          ),
          body: SizedBox.expand(
            child: Container(
              padding: EdgeInsets.all(
                mediaQueryData.size.width * 0.02
              ),
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: this.tabBarView,
            ),
          ),
        ),
      );
    }

    return sheetCanvas;
  }
}