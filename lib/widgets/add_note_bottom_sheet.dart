import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // بنوفر ال AddNoteCubit هنا في ال Bottom Sheet عشان نستخدمه في الفورم بتاع اضافة الملاحظات فقط لاننا مش محتاجينه في اي مكان تاني في الابلكيشن
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        // بنستخدم BlocConsumer عشان نبني الواجهة و نستمع لتغيرات الحالة في نفس الوقت عن طريق تنفيذ ال listener اللي هي جواها الاكواد
        // بس احنا هنا مش عايزين نعيد بناء الواجهة هنستخدم BlocListener بدل BlocConsumer لانه بياخد listener بس من غير builder
        // بس انا هنا استخدمت BlocConsumer عشان هستخدم ويدجت AbsorbPointer عشان امنع المستخدم من التفاعل مع الفورم لما الحالة تكون Loading
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            // لو النوت اتضافت بنجاح هنحدث الواجهة بجلب البيانات المتحدثة وبعد كدا هنقفل ال Bottom Sheet
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          } else if (state is AddNoteFailure) {
            // لو في خطأ حصل هنظهر رسالة خطأ للمستخدم
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to add note: ${state.errMessage}'),
              ),
            );
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            // بنستخدم AbsorbPointer عشان نمنع التفاعل مع الفورم لما الحالة تكون Loading يعني لما النوت بتتضاف
            // عشان مايحصلش مشاكل لو المستخدم ضغط على اي حاجة في الفورم وهو في حالة Loading
            // بنخلي absorbing تساوي true لما الحالة تكون Loading وعشان كده بنستخدم BlocConsumer مش BlocListener
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              // حطينا ModalProgressHUD فوق ال padding عشان مايحصلش overflow لل height عند ظهور مؤشر التحميل ولون الخلفية بتاع الانديكاتور يبقي هو هو بتاع showModalBottomSheet
              padding: EdgeInsets.only(
                right: 16.0,
                left: 16.0,
                // عشان لما يطلع الكيبورد مايحصلش overflow لل height يعني الشاشة متغيرش نفسها
                // viewInsets.bottom بترجع المساحة اللي اتاخدت من الشاشة بسبب الكيبورد
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}

// الفرق بين BlockBuilder و BlockConsumer و BlocListener:
// 1. BlocBuilder: بنستخدمه لما نكون عايزين نبني واجهة بناءً على الحالة الحالية لل Cubit او Bloc زي لما نكون عايزين نعرض بيانات معينة بناءً على حالة زي loading او success او failure
// 2. BlocListener: بنستخدمه لما نكون عايزين نستمع لتغيرات الحالة ونعمل حاجة معينة لما الحالة تتغير (زي اظهار رسالة او التنقل لصفحة تانية) يعني بيبقي فيه return Widget
// 3. BlocConsumer: هو مزيج بين BlocBuilder و BlocListener بنستخدمه لما نكون عايزين نبني واجهة ونستمع لتغيرات الحالة في نفس الوقت
// في الحالة دي انا استخدمت BlocConsumer عشان اقدر ابني الواجهة و استمع للحالات المختلفة لل Cubit في نفس الوقت
