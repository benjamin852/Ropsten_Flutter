import 'package:flutter/material.dart';

typedef OnRadioChanged = void Function(dynamic value);

class PaperRadio extends StatelessWidget {
  final String title;
  final dynamic value; //select private key or mnmemonic button
  final dynamic groupValue; //currently selected button
  final OnRadioChanged onChanged; //set private key or mnemonic value

  PaperRadio({
    this.title,
    this.value,
    this.groupValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(title)
      ],
    );
  }
}
