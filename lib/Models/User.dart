import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/CreateUser/createUser.dart';
import 'package:flutter2/Modules/itemCard.dart';
import 'package:flutter2/Users/usersDetails.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "All entities in the Company :",
            style: TextStyle(fontSize: 20),
          ),
        ),
        UserInformations(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: TextButton(
              style: TextButton.styleFrom(
                  minimumSize: Size(150, 50),
                  side: BorderSide(color: Colors.blue)),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateUser())),
              child: Text('Create User +')),
        ),
      ],
    );
  }
}

class UserInformations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading...");
        }

        return new ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return new ItemCard(
                name: document.data()['name'],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UsersDetails(
                              users: document,
                            ))));
          }).toList(),
        );
      },
    );
  }
}

class User {
  List<String> documentIds = [];

  List<String> getUserDocIds() {
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        documentIds.add(doc.id);
      });
    });
    return documentIds;
  }

  final String name, email;

  User({
    this.name,
    this.email,
  });
}
