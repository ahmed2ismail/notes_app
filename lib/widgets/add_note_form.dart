import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final _formKey = GlobalKey<FormState>();
  // autovalidateMode variable to control form validation mode / بنستخدمها عشان نتحكم في وضع التحقق من صحة الفورم يعني هل البيانات بتتراجع اوتوماتيك ولا لأ وهل هي صحيحة ولا لأ
  // بمعني هل البيانات اللي المستخدم بيدخلها زي منا عايز ولا غلط
  // طبعا انا في الاول بخليها معطلة لحد ما المستخدم يضغط على زرار الاضافة وبعد كده بغير قيمتها عشان ابدا التحقق من صحة البيانات
  // وبناءا علي التغيير دا فلازم يكون StatefulWidget مش StatelessWidget
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  // لو هننشا اي متغير مش final فلازم نعمله جوه StatefulWidget مش StatelessWidget عشان نقدر نغير قيمته و تتحدث الواجهة
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 8),
          const Text(
            'Add Note',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'Content',
            maxLines: 5,
            onSaved: (value) {
              content = value;
            },
          ),
          const SizedBox(height: 55),
          CustomButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // بمعني لو البيانات كلها صح
              // حفظ البيانات اللي المستخدم دخلها في الفورم والبيانات دي بتتحفظ في المتغيرات اللي انا معرفها فوق
              _formKey.currentState?.save();
              } else {
              // لو في بيانات غلط فهنفعل التحقق من صحة البيانات عشان يبان للمستخدم ايه الغلط
                autovalidateMode = AutovalidateMode.always;
              setState(() {}); // عشان نحدث الواجهة عشان التغيير اللي حصل في autovalidateMode يظهر في الفورم
              }
              // طباعة البيانات في الكونسول عشان اتاكد انها بتتسجل صح
              print('Title: $title');
              print('Content: $content');
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
