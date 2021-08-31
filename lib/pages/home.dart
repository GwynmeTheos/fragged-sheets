import 'package:flutter/material.dart';
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

  //TODO SheetModel? showNewCharacterAlert(BuildContext context){
  //   return;
  // }
  
  //TODO SheetModel? showNewVehicleAlert(BuildContext context){
  //   return;
  // }

  //TODO SheetModel? showImportSheetAlert(BuildContext context){
  //   return;
  // }
  
  List<Widget> getSidebarContent(BuildContext context) {
    List<Widget> content = List<Widget>.empty(growable: true);

    // Logo
    content.add(
      GestureDetector(
        child: Image.asset(
          widget.activeSheet == null
            ? Editions.EMPIRE.logo
            : widget.activeSheet!.edition.logo
        ),
        onTap: () {
          setState(() {
            widget.onActiveSheetChanged(null, this.activeSheetIndex);
            this.activeSheetIndex = -1;
          });
        },
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
            Icons.person,
            color: Colors.black,
          ),
          title: Text("New character"),
          onTap: () async {
            SheetModel? newSheet = await showAlert(
              context,
              title: Text("YT"),
              body: Text("YT")
            );
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
            SheetModel? newSheet = await showAlert(
              context,
              title: Text("YT"),
              body: Text("YT")
            );
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
            SheetModel? newSheet = await showAlert(
              context,
              title: Text("YT"),
              body: Text("YT")
            );
            if (newSheet != null) {this.sheets.add(newSheet);}
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
            "Fragged Sheets",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
          ),
          actions: [

          ],
        ),
        body: SizedBox.expand(
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Thank you for using Fragged Sheets."+ 
                    "\nFragged Sheets was made by Leonardo Dias."+
                    "\nFragged Empire, Aeternum, Seas, Kingdom, etc are owned by Design Ministries and Wade Dyer.\n",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ),
        ),
      );
    } else {
      sheetCanvas = Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            widget.sheet!.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
          ),
          actions: [

          ],
        ),
        body: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
          ),
        ),
      );
    }

    return sheetCanvas;
  }
}