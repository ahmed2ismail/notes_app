part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesLoading extends NotesState {}

final class NotesSuccess extends NotesState {
  // قائمة الملاحظات اللي تم جلبها بنجعلها immutable باستخدام final
  // ده بيساعد في الحفاظ على سلامة البيانات ومنع التعديلات غير المقصودة عليها
  // انا هنا حطيت الليست بتاعت النوتس جوه الحالة عشان لما الحالة تبقي Success يبقي معايا الداتا اللي هاعرضها في ال UI ولانه انا بتعامل مع الليست مرة واحدة ومش محتاج اقعد اباصي البيانات جوه ال tree لان كلها هتبقي موجودة جوه حالة ال success
  final List<NoteModel> notes;

  NotesSuccess(this.notes);
}

final class NotesFailure extends NotesState {
  final String errMessage;

  NotesFailure(this.errMessage);
}