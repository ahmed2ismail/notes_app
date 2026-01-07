import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constansts.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

// ال Cubit دا هي manage ال state بتاعت NotesListView لاننا هنيجي قدام ونضيف حاجة لليست بتاعتنا فبالتالي لازم نعمل refresh لل list عشان تعرض البيانات الجديدة وكمان الهدف منه هو انع يعمل فصل او separate بين منطق ال business logic بتاعتنا وال UI عشان نخلي الكود منظم اكتر وسهل في الصيانة والتطوير
// فانا هنا عملت Cubit خاص بالملاحظات عشان يدير الحالة الخاصة بي
class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;

  dynamic fetchAllNotes() {
    final notesBox = Hive.box<NoteModel>(kNotesBoxName);
    // .values => Iterable<NoteModel> get values => بيجيب كل القيم اللي جوه ال box على شكل Iterable بمعني collection يعني مجموعة من العناصر
    notes = notesBox.values.toList();
  }
}
