// الخطوة 1: استيراد الحزمة اللازمة لإنشاء Cubit وبنائه
// Cubit هو جزء من مكتبة flutter_bloc اللي بتساعدنا في إدارة الحالة (state management) في تطبيقات Flutter
// Cubit هو نسخة مبسطة من Bloc بيسمح لنا بإدارة الحالة بطريقة أسهل وأبسط
// انا عملته عشان ن manage الحالة بتاعت اضافة الملاحظات في التطبيق
// انشاناه عشان لما نيجي نضيف او نعرض  او نعدل الملاحظات نقدر ندير الحالة بتاعتنا بشكل منظم
// مبدا ال single responsibility principle بيقول ان كل كلاس او فانكشن لازم يكون ليه مسؤولية واحدة بس لتبسيط الكود وتنظيمه
// فانا هنا عملت Cubit خاص بالملاحظات عشان يدير الحالة الخاصة بيها واي خاصية تانية هنعمل ليها cubit خاص بيها
// انشاء الكلاس الخاص بالـ Cubit
// بنسميه AddNotesCubit لان هو هيكون مسؤول عن ادارة الحالة الخاصة بالملاحظات
// بنورثه من Cubit وندي له النوع بتاع الحالة اللي هي Manageها (AddNotesState)
// في الكونستركتور بنادي على الكونستركتور بتاع الاب (super)
// ## خطوات انشاء الـ Cubit:
// 1. استيراد مكتبة flutter_bloc
// 2. انشاء كلاس الحالة (State) الخاص بالـ Cubit
// 3. انشاء كلاس الـ Cubit نفسه
// وبعد كده بنعمل ملف للـ States بتاعتنا عشان ننظم الكود اكتر
// بعد محدد الحالات بكتب الكود وبعد كده ب provide ال Cubit في المكان المناسب في الابلكيشن

// ## كود انشاء الـ Cubit:

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constansts.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Future<void> addNote(NoteModel note) async {
    // هنا هنضيف الكود الخاص باضافة النوت الجديدة
    // ممكن نستخدم Hive او اي طريقة تانية عشان نخزن النوت الجديدة
    // بعد ما نضيف النوت بنغير الحالة بناءً على نتيجة العملية
    // مثلا: لو العملية نجحت بنغير الحالة لـ AddNoteSuccess
    // ولو فشلت بنغير الحالة لـ AddNoteFailure مع رسالة الخطأ
    // emit => وظيفتها انها تبعت الحالة الجديدة للـ Cubit عشان الواجهة تعرف تتغير بناءً على الحالة الجديدة
    // emit => وأبسط مثال على استخدامها هو لما نبدأ عملية اضافة النوت بنبعت حالة التحميل
    emit(AddNoteLoading());
    try {
      final notesBox = Hive.box<NoteModel>(kNotesBoxName);
      await notesBox.add(note);
      // لما العملية تنجح بنبعت حالة النجاح
      emit(AddNoteSuccess());
    } on Exception catch (e) {
      // لما العملية تفشل بنبعت حالة الفشل مع رسالة الخطأ
      emit(AddNoteFailure(e.toString()));
    }
  }
}

// كده احنا انشأنا Cubit خاص باضافة الملاحظات
// وبعد كده هنبدا نستخدمه في الابلكيشن بتاعنا عشان ندير الحالة الخاصة باضافة الملاحظات عن طريق provide cubit في المكان المناسب