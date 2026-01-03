import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const EditNoteView(),));
      },
      child: Container(
        padding: EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 16),
        decoration: BoxDecoration(
          color: Color(0xffFFCC80),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Flutter Tips',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              subtitle: Text(
                'Build Your Career With Tharwat Samy',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withValues(alpha: 0.5),
                ),
              ),
              trailing: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.trash, size: 25, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'May21, 2022',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withValues(alpha: 0.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
