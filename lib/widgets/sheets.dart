import 'package:flutter/material.dart';
import 'package:fragged_sheets/models/models.dart';

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
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 36,
            alignment: Alignment.center,
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
          SizedBox(
            width: 5,
          ),
          Container(
            child: content
          )
        ],
      )
    );
  }
}

class NamedTextField extends StatelessWidget {
  final String text;
  final double nameSize;
  final double fieldSize;
  final TextEditingController controller;
  final Function() onChanged;

  NamedTextField({
    required this.text,
    required this.nameSize,
    required this.fieldSize,
    required this.controller,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: nameSize,
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              text
            ),
          )
        ),
        SizedBox(width: 12,),
        Container(
          width: this.fieldSize,
          child: TextFormField(
            controller: this.controller,
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
              this.onChanged();
            },
            onFieldSubmitted: (String? text) {
              this.onChanged();
            },
            onEditingComplete: () {
              this.onChanged();
            },
          ),
        )
      ]
    );
  }
}