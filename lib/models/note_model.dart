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
  final DateTime date;

  @HiveField(3)
  final int color;

  NoteModel({
    required this.title,
    required this.content,
    required this.date,
    required this.color,
  });
}
