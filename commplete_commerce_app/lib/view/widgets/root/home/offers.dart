// import 'package:flutter/material.dart';
//
// import '../../dot_indicator.dart';
//
// class Offers extends StatelessWidget {
//   const Offers({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.87,
//       child: Stack(
//         alignment: Alignment.bottomRight,
//         children: [
//           PageView.builder(
//             controller: _pageController,
//             itemCount: offers.length,
//             onPageChanged: (int index) {
//               setState(() {
//                 _selectedIndex = index;
//               });
//             },
//             itemBuilder: (context, index) => offers[index],
//           ),
//           FittedBox(
//             child: Padding(
//               padding: const EdgeInsets.all(15),
//               child: SizedBox(
//                 height: 16,
//                 child: Row(
//                   children: List.generate(
//                     offers.length,
//                     (index) {
//                       return Padding(
//                         padding:
//                             const EdgeInsets.only(left: defaultPadding / 4),
//                         child: DotIndicator(
//                           isActive: index == _selectedIndex,
//                           activeColor: Colors.white70,
//                           inActiveColor: Colors.white54,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
