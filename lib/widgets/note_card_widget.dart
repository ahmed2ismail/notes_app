import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditNoteView(note: note)),
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 16),
        decoration: BoxDecoration(
          // color: Color(0xffFFCC80),
          color: Color(note.color),
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
                  // 'Flutter Tips',
                  note.title,
                  style: const TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              subtitle: Text(
                // 'Build Your Career With Tharwat Samy',
                note.content,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withValues(alpha: 0.5),
                ),
              ),
              trailing: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  note.delete();
                  // بعد ما نحذف النوت من ال Hive لازم نحدث الواجهة عشان نشيل النوت المحذوف من الليست ونعرض الليست المحدث
                  // بنادي على ال fetchAllNotes عشان يجيبلي النوتس المحدثة من ال Hive ويحدث الواجهة ودا بيحصل بسبب وجود حالة ال success في ال emit في Notescubit
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                // 'May21, 2022',
                note.date,
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
