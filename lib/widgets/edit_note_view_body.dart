import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: const [
          SizedBox(height: 50),
          CustomTextFormField(hintText: 'Title'),
          SizedBox(height: 16),
          CustomTextFormField(hintText: 'Content', maxLines: 5),
        ],
      ),
    );
  }
}
