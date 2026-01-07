import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/custom_icon.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit()..fetchAllNotes(),
      child: Scaffold(
        // resizeToAvoidBottomInset: false, // عشان لما يطلع الكيبورد مايحصلش overflow لل height يعني الشاشة متغيرش نفسها
        appBar: AppBar(
          title: const Text(
            'Notes',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          actionsPadding: const EdgeInsets.only(right: 16, top: 10),
          actions: [CustomIcon(icon: const Icon(Icons.search))],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          onPressed: () {
            showModalBottomSheet(
              // عشان نقدر نطلع الكيبورد من غير ما يحصل overflow لل height و ال showModalBottomSheet بيطلع فوق الكيبورد والاتنين بيكونوا ظاهرين مع بعض
              isScrollControlled: true,
              context: context,
              builder: (context) => const AddNoteBottomSheet(),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            return NotesListView();
          },
        ),
      ),
    );
  }
}
