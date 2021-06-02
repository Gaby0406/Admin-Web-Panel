// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/Modules/itemCard.dart';
import 'package:flutter2/Theme/Theme.dart';

class UsersBody extends StatelessWidget {
  final DocumentSnapshot user;
  const UsersBody({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 200.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text("Name:  "), Text(user.data()['name'])],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text("Email:  "), Text(user.data()['email'])],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              child: Text("Roles: "),
              alignment: Alignment.topLeft,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              child: RoleUser(user: user),
              alignment: Alignment.topLeft,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              child: Text("Groups: "),
              alignment: Alignment.topLeft,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              child: GroupUser(user: user),
              alignment: Alignment.topLeft,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              child: Text("Right: "),
              alignment: Alignment.topLeft,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  child: RightUser(user: user),
                  width: 300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoleUser extends StatelessWidget {
  final DocumentSnapshot user;

  RoleUser({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users_roles")
            .where('user_id', isEqualTo: user.id)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState.index == 1)
            return Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          if ((snapshot.hasData && snapshot.data != null) &&
              (snapshot.connectionState.index == 2)) {
            final userRoleid = snapshot.data.docs.first['role_id'];
            if (userRoleid != null) {
              return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('roles')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState.index == 1)
                      return Material(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    if ((snapshot.hasData && snapshot.data != null) &&
                        (snapshot.connectionState.index == 2)) {
                      final userRole = snapshot.data.docs
                          .where((element) => element.id == userRoleid)
                          .first
                          .data()['type'];

                      return Container(
                        width: 80,
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            color: AppTheme.ZK_Gray,
                            border: Border.all(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            userRole == null ? "" : userRole,
                          ),
                        ),
                      );
                    }
                  });
            } else {
              return Material(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }
        });
  }
}

class GroupUser extends StatelessWidget {
  final DocumentSnapshot user;

  GroupUser({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users_groups")
            .where('user_id', isEqualTo: user.id)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState.index == 1)
            return Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          if ((snapshot.hasData && snapshot.data != null) &&
              (snapshot.connectionState.index == 2)) {
            final userGroupid = snapshot.data.docs.first['group_id'];
            print(userGroupid);
            if (userGroupid != null) {
              return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('groups')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState.index == 1)
                      return Material(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    if ((snapshot.hasData && snapshot.data != null) &&
                        (snapshot.connectionState.index == 2)) {
                      final userGroup = snapshot.data.docs
                          .where((element) => element.id == userGroupid)
                          .first
                          .data()['store'];
                      if (userGroup == null)
                        print("No group assigned.");
                      else
                        print(userGroup.toString());

                      return Container(
                        width: 80,
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            color: AppTheme.ZK_Gray,
                            border: Border.all(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            userGroup == null ? "" : userGroup,
                          ),
                        ),
                      );
                    }
                  });
            } else {
              return Material(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }
        });
  }
}

class RightUser extends StatelessWidget {
  final DocumentSnapshot user;

  RightUser({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users_right")
            .where('user_id', isEqualTo: user.id)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState.index == 1)
            return Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          if ((snapshot.hasData && snapshot.data != null) &&
              (snapshot.connectionState.index == 2)) {
            List<String> userRightids = [];
            final userRightid = snapshot.data.docs.forEach((element) {
              userRightids.add(element.data()['right_id'].toString());
            });
            if (userRightids.length != 0) {
              return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('rights')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState.index == 1)
                      return Material(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    if ((snapshot.hasData && snapshot.data != null) &&
                        (snapshot.connectionState.index == 2)) {
                      List<String> userRightNames = [];

                      for (var rightId in userRightids) {
                        final userRightid =
                            snapshot.data.docs.forEach((element) {
                          if (element.id == rightId)
                            userRightNames
                                .add(element.data()['type'].toString());
                        });
                        if (rightId == null)
                          print("No Right assigned.");
                        else
                          print(rightId.toString() + "\r");
                      }
                      for (var item in userRightNames) {
                        print(item);
                      }
                      return new ViewInfoUser(specList: userRightNames);
                    }
                  });
            } else {
              return Material(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }
        });
  }
}

class ViewInfoUser extends StatelessWidget {
  final List<String> specList;

  const ViewInfoUser({Key key, this.specList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(Duration(seconds: 2)),
        builder: (context, snapshot) {
          return Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    addRepaintBoundaries: true,
                    itemCount: specList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 80,
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            color: AppTheme.ZK_Gray,
                            border: Border.all(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            specList[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
