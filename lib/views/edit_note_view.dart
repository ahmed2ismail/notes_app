import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_icon.dart';
import 'package:notes_app/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(  
          'Edit Note',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        actionsPadding: const EdgeInsets.only(right: 16, top: 10),
        actions: [CustomIcon(icon: const Icon(Icons.check))],
      ),
      body: const EditNoteViewBody(),
    );
  }
}
