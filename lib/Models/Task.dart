import 'package:flutter/cupertino.dart';

class Task {
  final String name;
  final DateTime date;
  final DateTime end;
  final Icon icon;
  final String type;
  final String details;

  Task({this.name, this.date, this.icon, this.end, this.type, this.details});
}

List<Task> tasks = [
  Task(
      name: 'Reception',
      type: 'Other',
      date: DateTime.utc(2021, 5, 18, 9, 0, 0),
      end: DateTime.utc(2021, 5, 18, 11, 0, 0),
      icon: Icon(IconData(59842, fontFamily: 'MaterialIcons')),
      details: 'From aisle 1 to aisle 6'),
  Task(
      name: 'Feed dog',
      type: 'Feeding',
      date: DateTime.utc(2021, 5, 18, 12, 0, 0),
      end: DateTime.utc(2021, 5, 18, 15, 0, 0),
      icon: Icon(IconData(59662, fontFamily: 'MaterialIcons')),
      details: 'From aisle 1 to aisle 6'),
  Task(
      name: 'Clean cage',
      type: 'Cleaning',
      date: DateTime.utc(2021, 5, 5, 15, 0, 0),
      end: DateTime.utc(2021, 5, 5, 17, 0, 0),
      icon: Icon(IconData(58971, fontFamily: 'MaterialIcons')),
      details: 'From aisle 1 to aisle 6'),
  Task(
      name: 'Feed cats',
      type: 'Feeding',
      date: DateTime.utc(2021, 5, 6, 9, 11, 30),
      end: DateTime.utc(2021, 5, 6, 11, 0, 0),
      icon: Icon(IconData(59662, fontFamily: 'MaterialIcons')),
      details: 'From aisle 1 to aisle 6'),
];
