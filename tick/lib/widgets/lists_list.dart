// import 'package:flutter/material.dart';
// import 'package:tick/models/checklist_model.dart';
// import 'package:tick/style/style.dart';

// class ListsList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GridView.count(
//         // Create a grid with 2 columns. If you change the scrollDirection to
//         // horizontal, this produces 2 rows.
//         crossAxisCount: 2,
//         // Generate 100 widgets that display their index in the List.
//         children: List.generate(lists.length, (index) {
//           return Container(
//             decoration: BoxDecoration(boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 spreadRadius: 1,
//                 blurRadius: 8,
//                 offset: Offset(0.0, 0.0),
//               )
//             ]),
//             child: Container(
//               color: ColorsWhite,
//               child: Center(
//                 child: Text(
//                   lists[index].title,
//                   style: Theme.of(context).textTheme.headline,
//                 ),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
