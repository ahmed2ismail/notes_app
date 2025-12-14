
import 'package:flutter/material.dart';

class NotesView extends StatelessWidget {
  const NotesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(child: Text('Welcome to the Notes App!')),
    );
  }
}
