import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Notes {
  String title;
  String date;
  String content;

  Notes({required this.title, required this.date, required this.content});

  factory Notes.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Notes(
      title: data?['title'],
      date: data?['date'],
      content: data?['content'],
    );
  }

  static List<Color> notesColor = [
    Colors.red.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.yellow.shade100,
    Colors.orange.shade100,
    Colors.pink.shade100,
    Colors.blueGrey.shade100,
  ];
}