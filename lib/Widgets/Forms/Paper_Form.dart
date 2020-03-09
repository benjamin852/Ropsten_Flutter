import 'package:flutter/cupertino.dart';

class PaperForm extends StatelessWidget {
  final double padding;
  final List<Widget> actionButtons;
  final List<Widget> children;

  PaperForm({
    this.padding = 8,
    this.actionButtons,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        //consider changing padding to 8
        padding: EdgeInsets.all(this.padding),
        child: Column(children: [
          ..._actionButtons(),
          ...this.children,
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
