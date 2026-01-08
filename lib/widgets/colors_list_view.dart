import 'package:flutter/material.dart';

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
  List<Color> colors = const [
    Color(0xffDD6E42),
    Color(0xffE8DAB2),
    Color(0xff4F6D7A),
    Color(0xffC0D6DF),
    Color(0xffEAEAEA),
    Color(0xffFFA5A5),
    Color(0xffFFCE56),
    Color(0xff6BCB77),
    Color(0xff4D96FF),
    Color(0xff843b62),
    Color(0xff2a9d8f),
    Color(0xff264653),
    Color(0xfff4a261),
    Color(0xffe76f51),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // عشان ال CircleAvatar يكون ظاهر كامل
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentSelectedIndex = index;
                });
              },
              child: ColorItem(
                isSelected: currentSelectedIndex == index,
                color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
