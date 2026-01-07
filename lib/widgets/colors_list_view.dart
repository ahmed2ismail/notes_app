
// import 'package:flutter/material.dart';

// class ColorItem extends StatelessWidget {
//   const ColorItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CircleAvatar(backgroundColor: Colors.amber, radius: 40.0);
//   }
// }

// class ColorsListView extends StatelessWidget {
//   const ColorsListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       // عشان ال CircleAvatar يكون ظاهر كامل
//       height: 80, // equal 2 * radius ==> 40 * 2 = 80
//       // width: double.infinity,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 20,
//         itemBuilder: (context, index) {
//           return const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 4.0),
//             child: CircleAvatar(),
//           );
//         },
//       ),
//     );
//   }
// }
