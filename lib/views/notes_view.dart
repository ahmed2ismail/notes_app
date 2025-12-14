import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_search_icon.dart';
import 'package:notes_app/widgets/note_card_widget.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        actionsPadding: const EdgeInsets.only(right: 16, top: 10),
        actions: [CustomSearchIcon()],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: NoteCardWidget(),
        ),
      ),
    );
  }
}
