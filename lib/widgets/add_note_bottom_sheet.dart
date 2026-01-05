import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            // لو النوت اتضافت بنجاح هنقفل ال Bottom Sheet
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
          return ModalProgressHUD(
            // بنستخدم ModalProgressHUD عشان نعرض مؤشر تحميل لما الحالة بتاعت ال Cubit تكون Loading ولازم يكون فوق ال SingleChildScrollView عشان مايحصلش overflow لل height عند ظهور مؤشر التحميل
            inAsyncCall: state is AddNoteLoading ? true : false,
            child: const SingleChildScrollView(child: AddNoteForm()),
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
