import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constansts.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  // الخطوة التانية عشان نستخدم الـ Hive في الفلاتر هي ان احنا نضيف مكتبة hive_flutter
  // هنعمل initialize للـ Hive قبل ما نشغل الابلكيشن جوه ال main function
  await Hive.initFlutter();
  // تسجيل الـ Adapter اللي اتعمله توليد
  Hive.registerAdapter(NoteModelAdapter());
  // فتح الصندوق الخاص بالملاحظات مع تحديد النوع <NoteModel>
  await Hive.openBox<NoteModel>(kNotesBoxName); // اسم الصندوق هو notes_box
  // بعد ما نفتح الصندوق نقدر نستخدمه في اي مكان في الابلكيشن عشان نخزن ونقرأ الملاحظات او البيانات

  // بنسجل ال BlocObserver بتاعنا
  Bloc.observer = SimpleBlocObserver();
  // بعد مسجلناه هنروح نعمل trigger للبيانات في ملف ال add_note_form

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    // الخطوة اللي عليها الدور بعد انشاء ال cubit هي استخدامه عن طريق MultiBlocProvider فوق ال MaterialApp عشان نوفر ال Cubit لكل الابلكيشن
    // بنستخدم MultiBlocProvider لما يكون عندنا اكتر من Cubit او Bloc عشان نوفرهم في نفس الوقت في الابلكيشن
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNoteCubit(),
          // وكده ال AddNoteCubit عمره مهيتقفل طول م الابلكيشن شغال عشان احنا موفرينه فوق ال MaterialApp ودا بيستهلك ال resources بتاعت الجهاز بشكل اكبر شوية
          // لو حبينا نقفل ال Cubit لما نخرج من الابلكيشن ممكن نستخدم BlocProvider بدل MultiBlocProvider ونوفره بس في الصفحة اللي هنستخدمه فيها ودا اللي هنعمله
        ),
      ],
      child: MaterialApp(
      */
    return BlocProvider(
      create: (context) => NotesCubit()..fetchAllNotes(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        theme: ThemeData(
          brightness: Brightness.dark,
          // scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          useMaterial3: true,
          fontFamily: 'Poppins',
        ),
        home: NotesView(),
      ),
    );
  }
}
