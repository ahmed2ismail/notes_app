import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_icon.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false, // يخفي الزر لكن يمكن الوصول للشاشة بالـ back gesture
        title: const Text(
          'Edit Note',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        actionsPadding: const EdgeInsets.only(right: 16, top: 10),
        actions: [
          CustomIcon(
            icon: const Icon(Icons.check),
            onPressed: () {
              // Save the edited note
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();
              // بعد ما نحفظ التعديلات على النوت في ال Hive لازم نحدث الواجهة عشان نعرض النوتس المحدثة
              // بنادي على ال fetchAllNotes عشان يجيبلي النوتس المحدثة من ال Hive ويحدث الواجهة ودا بيحصل بسبب وجود حالة ال success في ال emit في Notescubit
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            CustomTextFormField(
              hintText: widget.note.title,
              onChanged: (value) {
                // Handle title change
                title = value;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: widget.note.content,
              maxLines: 5,
              onChanged: (value) {
                // Handle content change
                content = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
