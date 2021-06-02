import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/Users/usersDetails.dart';

class UserBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('users');

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("You don't have the Rights to do that");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return new ItemCard(
              name: document.data()['name'],
              press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UsersDetails(
                                  users: document,
          )))
            );
          }).toList(),
        );
      },
    );
  }
}

class ItemCard extends StatelessWidget {
  final String name;
  final Function press;

  const ItemCard({
    Key key,
    this.press, this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              name,
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

