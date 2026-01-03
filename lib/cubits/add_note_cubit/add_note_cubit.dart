// الخطوة 1: استيراد الحزمة اللازمة لإنشاء Cubit
// Cubit هو جزء من مكتبة flutter_bloc اللي بتساعدنا في إدارة الحالة (state management) في تطبيقات Flutter
// Cubit هو نسخة مبسطة من Bloc بيسمح لنا بإدارة الحالة بطريقة أسهل وأبسط
// انا عملته عشان ن manage الحالة بتاعت اضافة الملاحظات في التطبيق
// انشاناه عشان لما نيجي نضيف او نعرض  او نعدل الملاحظات نقدر ندير الحالة بتاعتنا بشكل منظم
// مبدا ال single responsibility principle بيقول ان كل كلاس او فانكشن لازم يكون ليه مسؤولية واحدة بس لتبسيط الكود وتنظيمه
// فانا هنا عملت Cubit خاص بالملاحظات عشان يدير الحالة الخاصة بيها واي خاصية تانية هنعمل ليها cubit خاص بيها
// الخطوة 2: انشاء الكلاس الخاص بالـ Cubit
// بنسميه NotesCubit لان هو هيكون مسؤول عن ادارة الحالة الخاصة بالملاحظات
// بنورثه من Cubit وندي له النوع بتاع الحالة اللي هي Manageها (NotesCubitState)
// في الكونستركتور بنادي على الكونستركتور بتاع الاب (super)
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteCubitState {}

class AddNoteCubitInitial extends AddNoteCubitState {}

class AddNoteCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubit() : super(AddNoteCubitInitial());
}