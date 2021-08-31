import 'package:flutter/material.dart';

dynamic showAlert(BuildContext context, {required Widget title, required Widget body, List<InkWell>? actionButtons, bool close: true}) {
  List<Widget> alertElements = List<Widget>.empty(growable: true);
 
  alertElements.add(
    Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20
      ),
      child: title,
    ),
  );
  alertElements.add(
    SizedBox(
      height: 5.0,
    ),
  );
  alertElements.add(
    Divider(
      color: Colors.grey,
      height: 4.0,
    ),
  );
  alertElements.add(
    Container(
      padding: EdgeInsets.all(20),
      child: body,
    ),
  );
 
  alertElements.add(
    Divider(
      color: Colors.black,
      thickness: 1,
      height: 1,
    )
  );
 
  if (actionButtons != null) {
    for (int i = 0; i < actionButtons.length; i++) {
      alertElements.add(actionButtons[i]);
      alertElements.add(
        Divider(
          color: Colors.black,
          thickness: 1,
          height: 1,
        )
      );
    }
  }
 
  if (close) {
    alertElements.add(
      InkWell(
        child: Container(
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32.0),
              bottomRight: Radius.circular(32.0)
            ),
          ),
          child: Text(
            "Close",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800
            ),
            textAlign: TextAlign.center,
          ),
        ),
        onTap: () => Navigator.pop(context),
      ),
    );
  } else {
    alertElements.add(
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
                  "Yes",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: () => Navigator.of(context).pop(true),
            ),
          ),
          Container(
            width: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(32.0)
                  ),
                ),
                child: Text(
                  "No",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: () => Navigator.of(context).pop(false)
            ),
          )
        ],
      )
    );
  }
 
  return showDialog(
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
        contentPadding: EdgeInsets.only(top: 10.0),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: alertElements,
          ),
        ),
      );
    }
  );
}
