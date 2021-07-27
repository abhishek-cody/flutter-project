// import 'package:flutter/material.dart';
// import 'package:hello/screens/chat_screen.dart';

// class IndexScreen extends StatefulWidget {
//   static const id = 'Index_Screen';
//   @override
//   _IndexScreenState createState() => _IndexScreenState();
// }

// class _IndexScreenState extends State<IndexScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[900],
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey[900],
//         centerTitle: true,
//         title: Text('Index'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(15.0),
//         child: FlatButton(
//           onPressed: () {
//             Navigator.pushNamed(context, ChatScreen.id);
//           },
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: 20.0,
//                 backgroundColor: Colors.red,
//               ),
//               SizedBox(
//                 width: 20.0,
//               ),
//               Text(
//                 'Abhishek',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
