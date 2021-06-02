import 'package:flutter/material.dart';

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
