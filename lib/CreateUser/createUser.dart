import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/Theme/Theme.dart';
import 'package:flutter2/login.dart';

class CreateUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            UserValues(),
          ],
        ),
      ),
    );
  }
}

class UserValues extends StatefulWidget {
  @override
  _UserValuesState createState() => _UserValuesState();
}

class _UserValuesState extends State<UserValues> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static FirebaseFirestore _db = FirebaseFirestore.instance;
  static String _name;
  String _email;
  String _password;

  Future<void> _createUser() async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: _email, password: _password)
        .then((value) {
      print(value.additionalUserInfo);
      _db.collection('users').doc(value.user.uid).set({
        'name': _name,
        'email': _email,
      });
    }).catchError((e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    });
    print(FirebaseAuth.instance.currentUser.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your Name',
              ),
              onChanged: (value) => setState(() => _name = value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your Email',
              ),
              onChanged: (value) => setState(() => _email = value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your Password',
              ),
              onChanged: (value) => setState(() => _password = value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    child: GetRights(),
                    width: 300,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _createUser();
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetRights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('rights').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState.index == 1)
            return Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          if ((snapshot.hasData && snapshot.data != null) &&
              (snapshot.connectionState.index == 2)) {
            List<String> userRightNames = [];
            final userRights = snapshot.data.docs.forEach((element) {
              userRightNames.add(element.data()['type'].toString());
            });
            return new ViewInfoNewUser(specList: userRightNames);
          }
        });
  }
}

class ViewInfoNewUser extends StatelessWidget {
  final List<String> specList;

  const ViewInfoNewUser({Key key, this.specList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(Duration(seconds: 2)),
        builder: (context, snapshot) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
