import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  final String url;
  AppDrawer(this.url);
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Get Tokens'),
            subtitle: Text('Receive Tokens'),
            trailing: Icon(Icons.attach_money),
            onTap: () async {
              var url = 'https://faucet.clempe.dev?address=${widget.url}';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'could not launch $url';
              }
            },
          ),
          ListTile(
            title: Text('Get ETH'),
            subtitle: Text('Receive test ether'),
            trailing: Icon(Icons.attach_money),
            onTap: () async {
              var url = 'https://faucet.ropsten.be';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'could not launch $url';
              }
            },
          ),
          ListTile(
            title: Text('Reset Wallet'),
            subtitle: Text(
                'warning without your seed phrase you cannot reset your wallet'),
            trailing: Icon(Icons.warning),
            onTap: () async => Navigator.popAndPushNamed(context, '/'),
          )
        ],
      ),
    );
  }
}
