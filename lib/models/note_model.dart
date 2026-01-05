// اول خطوة بعد اضافة مكتبة الـ Hive في الـ pubspec.yaml هي ان احنا نعرف الموديل اللي هنخزن جواه البيانات في الـ Hive

import 'package:hive/hive.dart';
// اسم الملف اللي هيتولد فيه الكود تلقائياً
part 'note_model.g.dart'; // .g => generated / .dart => Dart file
// هنعمل هنا generate للـ Adapter الخاص بالـ Hive للـ NoteModel (generate type adapters)

// @HiveType(typeId: 0) => ال annotation دي بتقول لـ Hive (build runner اللي هي ال) ان الكلاس ده هيبقى موديل هيخزن جواه بيانات يعني المكان دا قيه كود هيتعمله توليد تلقائياً
@HiveType(typeId: 0) // كل موديل لازم ياخد ID فريد
class NoteModel extends HiveObject {
  @HiveField(0) // كل متغير بياخد رقم (Index) وبيكون تابع للكلاس
  final String title;

  @HiveField(1)
  final String content;

  @HiveField(2)
  // احنا خلينا ال date String عشان hive ما بيدعمش DateTime بشكل مباشر لانه Object و hive بيدعم بس الانواع البسيطة زي int, double, String, bool, List, Map اما لو احنا عايزين نخزن Object زي DateTime فلازم نعمل Adapter خاص بيه
  final String date;

  @HiveField(3)
  final int color;

  NoteModel({
    required this.title,
    required this.content,
    required this.date,
    required this.color,
  });
}

// بعد ما نخلص كتابة الموديل نروح للترمينال ونكتب الامر ده عشان نعمل generate للـ Adapter
// flutter packages pub run build_runner build
// الامر هيولد ملف اسمه note_model.g.dart جوه نفس الفولدر اللي فيه الموديل
// الملف هيبقى فيه كود جاهز للتعامل مع الـ Hive عشان يخزن ويقرأ البيانات من الصندوق (Box) بتاع الـ Hive
// الـ Adapter هو وسيط بين الموديل وصندوق الـ Hive عشان يقدر يخزن ويقرأ البيانات بشكل صحيح
// بعد كده هنروح لملف ال main.dart عشان نعمل initialize للـ Hive ونسجل الـ Adapter ونفتح الصندوق الخاص بالملاحظات جوه ال main function
// لو عايزين نعمل تحديث للـ Adapter بعد ما نعدل في الموديل نستخدم الامر ده
// flutter packages pub run build_runner build --delete-conflicting-outputs