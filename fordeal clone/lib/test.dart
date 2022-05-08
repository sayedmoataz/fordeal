// import 'package:flutter/material.dart';

// class Text extends StatefulWidget {
//   const Text({ Key? key }) : super(key: key);

//   @override
//   State<Text> createState() => _TextState();
// }

// class _TextState extends State<Text> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   width: width * 0.25,
//                   height: height * 0.8,
//                   child: Container(
//                     padding: EdgeInsets.all(12),
//                     child: ListView.builder(
//                       scrollDirection: Axis.vertical,
//                       itemCount: TextCard.length,
//                       itemBuilder: (context, index) => GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedIndex = index;
//                           });
//                         },
//                         child: Container(
//                           alignment: Alignment.center,
//                           padding: EdgeInsets.symmetric(horizontal: 16),
//                           margin: EdgeInsets.only(left: 12),
//                           child: Column(
//                             children: [
//                               Container(
//                                 height: 40,
//                                 width: 100,
//                                 color: index == selectedIndex
//                                     ? Color.fromARGB(255, 255, 255, 255)
//                                     : Colors.grey,
//                                 child: Center(
//                                   child: Text(
//                                     TextCard[index],
//                                     style: TextStyle(
//                                       fontWeight: index == selectedIndex
//                                           ? FontWeight.w700
//                                           : FontWeight.w400,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   color: Color.fromARGB(255, 18, 202, 147),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   width: width * 0.75,
//                   height: height * 0.8,
//                   color: Colors.yellow,
//                   child: SingleChildScrollView(),
//                 ),
//               ),
//             ],
//           ),
//   }
// }