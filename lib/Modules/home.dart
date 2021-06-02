import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/Theme/Theme.dart';

class Home extends StatefulWidget {
  const Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Align(
            alignment: Alignment(-0.90, 0.40),
            child: Text('👋 Hello',
                style: TextStyle(fontSize: 20, color: AppTheme.ZK_Olive)),
          )),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(
            padding: EdgeInsets.all(5.0),
            width: (MediaQuery.of(context).size.width) / 2,
            height: 120,
            child: ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppTheme.ZK_Gray),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(AppTheme.ZK_Olive),
                ),
                autofocus: false,
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                icon: Icon(
                  Icons.chat_rounded,
                  size: 40,
                ),
                label: Text('Messages', style: TextStyle(fontSize: 20)))),
        Container(
            padding: EdgeInsets.all(5.0),
            width: (MediaQuery.of(context).size.width) / 2,
            height: 120,
            child: ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppTheme.ZK_Gray),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(AppTheme.ZK_Olive),
                ),
                autofocus: false,
                onPressed: () {},
                icon: Icon(
                  Icons.add_circle_rounded,
                  size: 40,
                ),
                label: Text('Add a pet', style: TextStyle(fontSize: 20))))
      ]),
      Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Align(
            alignment: Alignment(-0.90, 0.40),
            child: Text('Announcment',
                style: TextStyle(fontSize: 25, color: AppTheme.ZK_Olive)),
          )),
    ]);
  }
}
