// الخطوة 2: انشاء ملف الحالة (State) الخاص بالـ Cubit اللي بيكون فيه كل الحالات المختلفة اللي ممكن تكون عليها عملية اضافة نوت جديدة
// هنا بنعرف الحالات المختلفة اللي ممكن تكون عليها عملية اضافة نوت جديدة
// مهم جدا: كل حالة من الحالات دي هتمثل حالة معينة للاضافة بتاعت النوت
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteFailure extends AddNoteState {
  final String errMessage;

  AddNoteFailure(this.errMessage);
}
