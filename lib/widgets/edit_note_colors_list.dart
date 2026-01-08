
import 'package:flutter/material.dart';
import 'package:notes_app/constansts.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentSelectedIndex;
  @override
  void initState() {
    super.initState();
    // Find the index of the note's color in the list of colors
    currentSelectedIndex = kColors.indexWhere(
      (color) => color.toARGB32() == widget.note.color,
    );
    // حل اخر
    // currentSelectedIndex = kColors.indexOf(Color(widget.note.color));
    // وكدا يكون ال initial color بتاعي هو ال color اللي النوت معمول بيه
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // عشان ال CircleAvatar يكون ظاهر كامل
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  // Update the note's color when a color is selected
                  widget.note.color = kColors[index].toARGB32();
                  currentSelectedIndex = index;
                });
              },
              child: ColorItem(
                isSelected: currentSelectedIndex == index,
                color: kColors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
