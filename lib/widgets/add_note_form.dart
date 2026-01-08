import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
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
          const SizedBox(height: 16),
          const ColorsListView(),
          const SizedBox(height: 60),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            // بنستخدم BlocBuilder عشان ن rebuild ال ui فقط
            // بنستخدم BlocBuilder عشان نقدر نغير شكل الزرار بناءا علي حالة ال Cubit يعني لما الحالة تكون Loading بنعرض مؤشر تحميل في الزرار ولما تكون مش Loading بنعرض النص العادي
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // بمعني لو البيانات كلها صح
                    // حفظ البيانات اللي المستخدم دخلها في الفورم والبيانات دي بتتحفظ في المتغيرات اللي انا معرفها فوق
                    _formKey.currentState?.save();
                    // الحصول على التاريخ الحالي بصيغة معينة عشان نحطه في نموذج النوت
                    DateTime currentDate = DateTime.now();
                    String formattedCurrentDate = DateFormat(
                      'dd-MM-yyyy',
                    ).format(currentDate);
                    // انشاء نموذج نوت جديد بالبيانات اللي المستخدم دخلها
                    var noteModel = NoteModel(
                      title: title!,
                      content: content!,
                      date: formattedCurrentDate,
                      color: Colors.blue.toARGB32(),
                    );
                    // بعد ما بحفظ البيانات بنعمل ايه؟
                    // هنا بنستخدم ال Cubit اللي انا عملته عشان اضيف النوت الجديدة
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    // لو في بيانات غلط فهنفعل التحقق من صحة البيانات عشان يبان للمستخدم ايه الغلط
                    autovalidateMode = AutovalidateMode.always;
                    setState(
                      () {},
                    ); // عشان نحدث الواجهة عشان التغيير اللي حصل في autovalidateMode يظهر في الفورم
                  }
                  // طباعة البيانات في الكونسول عشان اتاكد انها بتتسجل صح
                  // debugPrint('Title: $title');
                  // debugPrint('Content: $content');
                },
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
