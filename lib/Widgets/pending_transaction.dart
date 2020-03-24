import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PendingTransaction extends StatelessWidget {
  static const routeName = 'pending-transaction';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.send),
        title: Text('Pending Transaction'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Your transaction is being processed',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 35),
              SpinKitChasingDots(
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
