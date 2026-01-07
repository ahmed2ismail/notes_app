import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constansts.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  void fetchAllNotes() {
    try {
      final notesBox = Hive.box<NoteModel>(kNotesBoxName);
      final List<NoteModel> notes = notesBox.values.toList();
      // لما العملية تنجح بنبعت حالة النجاح
      emit(NotesSuccess(notes: notes));
    } on Exception catch (e) {
      // لما العملية تفشل بنبعت حالة الفشل مع رسالة الخطأ
      emit(NotesFailure(e.toString()));
    }
  }
}
