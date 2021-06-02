import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/Theme/Theme.dart';
import 'package:flutter2/Users/usersBody.dart';

class UsersDetails extends StatelessWidget {
  final DocumentSnapshot  users;

  const UsersDetails({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
          child: Scaffold(
        backgroundColor: AppTheme.ZK_Azure,
        appBar: AppBar(backgroundColor: AppTheme.ZK_Azure,),
        body: UsersBody(user: users),
      ),
    );
  }
}
