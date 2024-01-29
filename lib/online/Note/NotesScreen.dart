import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Notes.dart';

class NotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notes"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body:  StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Notes')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemCount:  snapshot.data!.docs.length, //posts.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = snapshot.data!.docs[index];
                Notes note = Notes(
                  title: document['title'],
                  date: document['date'],
                  content: document['content'],
                );

                return getNoteCard(note);
              },

          );
        },
      ),
    );
  }



  Widget getNoteCard(Notes note) {
    //for random color
    int randomColor = Random().nextInt(Notes.notesColor.length - 1);

    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Notes.notesColor[randomColor],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            note.date,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              note.content,
              style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}