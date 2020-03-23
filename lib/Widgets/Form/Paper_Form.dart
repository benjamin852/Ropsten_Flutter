import 'package:flutter/cupertino.dart';

class PaperForm extends StatelessWidget {
  final List<Widget> actionButtons; //just the import button
  final List<Widget> paperFormChildren;

  PaperForm({
    this.paperFormChildren,
    this.actionButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(children: [
          ...this.paperFormChildren,
          ..._actionButtons(),
        ]),
      ),
    );
  }

  List<Widget> _actionButtons() {
    if (this.actionButtons == null) return [Container()];
    return [
      SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: this.actionButtons,
      ),
    ];
  }
}
