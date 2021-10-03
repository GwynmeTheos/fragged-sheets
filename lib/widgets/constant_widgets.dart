import 'package:flutter/material.dart';

class ConstWidgets {
  static get sectionDivider{
    return Divider(
      color: Colors.black,
    );
  }

  static get itemDivider{
    return Divider(
      height: 5,
      color: Colors.grey.shade200,
    );
  }
}

class HorizontalBlock extends StatelessWidget {
  final String title;
  final Widget content;

  HorizontalBlock({
    this.title: "",
    required this.content
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10
            ),
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16)
              ),
              color: Colors.black
            ),
            child: RotatedBox(
              quarterTurns: -1,
              child: Text(
                this.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14
                ),
              ),
            )
          ),
          Container(
            child: content
          )
        ],
      )
    );
  }
}