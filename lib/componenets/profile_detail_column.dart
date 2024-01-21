

// import 'package:flutter/material.dart';
// import 'package:university/constants.dart';
//
// class ProfileDetailColumn extends StatelessWidget {
//   const ProfileDetailColumn(
//       {super.key, required this.title, required this.value});
//
//   final String title;
//   final String value;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(width: MediaQuery.of(context).size.width ,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
                   //  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                     //      fontSize: 15,
                       //    color: kTextLightColor,
//                         ),
//                   ),
//                   kHalfSizedBox,
//                   Text(
//                     value,
//                     style: Theme.of(context).textTheme.subtitle2!.copyWith(
//                           fontSize: 15,
//                           color: kTextBlackColor,
//                           fontWeight: FontWeight.w600,
//                         ),
//                   ),
//                   kHalfSizedBox,
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width / 1,
//                     child: const Divider(
//                       thickness: 1,
//                     ),
//                   ),
//                 ],
//               ),
//
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
