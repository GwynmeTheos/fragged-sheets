import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fragged_sheets/widgets/widgets.dart';
import 'package:fragged_sheets/models/models.dart';

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

  @override
  void initState(){
    super.initState();

    this.activeSheetIndex = widget.activeSheetIndex;

    this.sheets = List<SheetModel>.empty(growable: true);
    this.sheets.add(EmpireSheetModel(
      name: "Hello")
    );
    this.sheets.add(AeternumSheetModel(
      name: "World")
    );
  }

  @override
  void dispose(){
    super.dispose();
  }

  Future<SheetModel?> showNewCharacterAlert(BuildContext context) async {
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
                    "Create new character",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text("YT"),
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
  
  Future<SheetModel?> showNewVehicleAlert(BuildContext context) async {
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
                    "Create new vehicle",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text("YT"),
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
                  child: Text("YT"),
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
    content.add(
      Divider(
        color: Colors.black,
      )
    );

    // Character
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
    content.add(
      Divider(
        height: 5,
        color: Colors.grey.shade200,
      )
    );

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
            if (newSheet != null) {this.sheets.add(newSheet);}
          },
        ),
      )
    );
    content.add(
      Divider(
        height: 5,
        color: Colors.grey.shade200,
      )
    );

    // Vehicle
    content.add(
      Material(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          leading: Icon(
            Icons.two_wheeler,
            color: Colors.black,
          ),
          title: Text("New vehicle"),
          onTap: () async {
            SheetModel? newSheet = await showNewVehicleAlert(context);
            if (newSheet != null) {this.sheets.add(newSheet);}
          },
        ),
      )
    );
    content.add(
      Divider(
        height: 5,
        color: Colors.grey.shade200,
      )
    );

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
    content.add(
      Divider(
        height: 5,
        color: Colors.grey.shade200,
      )
    );

    // Import
    content.add(
      Material(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          leading: Icon(
            Github.github,
            color: Colors.black,
          ),
          title: Text("Github repo"),
          onTap: () async {
            await launch("https://github.com/GwynmeTheos/fragged-sheets");
          },
        ),
      )
    );
    content.add(
      Divider(
        color: Colors.black,
      )
    );

    for (int i = 0; i < this.sheets.length; i++){
      content.add(
        Material(
          borderRadius: BorderRadius.circular(10),
          color: this.activeSheetIndex == i
            ? Colors.grey.shade300
            : Colors.grey.shade50,
          child: ListTile(
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

    return content;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

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
                                  title: Text("Vehicle sheets for all editions (that have them)"),
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
                                  title: Text("GM Goon Sheets(?)"),
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
              SizedBox(
                
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.download,
                  color: Colors.white
                )
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(text: "Attributes",),
                Tab(text: "Skills",),
                Tab(text: "Equipment",),
                Tab(text: "Placeholder",),
                Tab(text: "Placeholder",),
              ],
            ),
          ),
          body: SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white
              ),
            ),
          ),
        )
      );
    }

    return sheetCanvas;
  }
}