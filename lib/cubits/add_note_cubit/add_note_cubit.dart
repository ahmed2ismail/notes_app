// الخطوة 1: استيراد الحزمة اللازمة لإنشاء Cubit وبنائه
// Cubit هو جزء من مكتبة flutter_bloc اللي بتساعدنا في إدارة الحالة (state management) في تطبيقات Flutter
// Cubit هو نسخة مبسطة من Bloc بيسمح لنا بإدارة الحالة بطريقة أسهل وأبسط
// انا عملته عشان ن manage الحالة بتاعت اضافة الملاحظات في التطبيق
// انشاناه عشان لما نيجي نضيف او نعرض  او نعدل الملاحظات نقدر ندير الحالة بتاعتنا بشكل منظم
// مبدا ال single responsibility principle بيقول ان كل كلاس او فانكشن لازم يكون ليه مسؤولية واحدة بس لتبسيط الكود وتنظيمه
// فانا هنا عملت Cubit خاص بالملاحظات عشان يدير الحالة الخاصة بيها واي خاصية تانية هنعمل ليها cubit خاص بيها
// انشاء الكلاس الخاص بالـ Cubit
// بنسميه AddNotesCubit لان هو هيكون مسؤول عن ادارة الحالة الخاصة بالملاحظات
// بنورثه من Cubit وندي له النوع بتاع الحالة اللي هي Manageها (AddNotesCubitState)
// في الكونستركتور بنادي على الكونستركتور بتاع الاب (super)
// ## خطوات انشاء الـ Cubit:
// 1. استيراد مكتبة flutter_bloc
// 2. انشاء كلاس الحالة (State) الخاص بالـ Cubit
// 3. انشاء كلاس الـ Cubit نفسه
// وبعد كده بنعمل ملف للـ States بتاعتنا عشان ننظم الكود اكتر
// بعد محدد الحالات بكتب الكود وبعد كده ب provide ال Cubit في المكان المناسب في الابلكيشن

// ## كود انشاء الـ Cubit:

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteCubitState {}

class AddNoteCubitInitial extends AddNoteCubitState {}

class AddNoteCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubit() : super(AddNoteCubitInitial());

  addNote(NoteModel note) {
  }
}