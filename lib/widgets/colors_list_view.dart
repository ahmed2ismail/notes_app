import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constansts.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});
  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 38.0,
            child: CircleAvatar(backgroundColor: color, radius: 34.0),
          )
        : CircleAvatar(backgroundColor: color, radius: 38.0);
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentSelectedIndex = 0;
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
                  currentSelectedIndex = index;
                  // هنا بنغير لون ال Cubit بتاع اضافة النوت عشان يبقي هو اللون اللي المستخدم اختاره
                  BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
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
