// import 'package:aplikasi/screens/mainScreen/choose_seat_page.dart';
// import 'package:flutter/material.dart';

// class EventDetailPage extends StatelessWidget {
//   final String title;
//   final String date;
//   final String artist;
//   final String time;
//   final String imagePath;

//   const EventDetailPage({
//     Key? key,
//     required this.title,
//     required this.date,
//     required this.artist,
//     required this.time,
//     required this.imagePath,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: Text(title),
//         centerTitle: true,
//         foregroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           //Banner Image
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               bottomLeft: Radius.circular(30),
//               bottomRight: Radius.circular(30),
//             ),
//             child: Image.asset(
//               imagePath,
//               width: double.infinity,
//               height: 250,
//               fit: BoxFit.cover,
//             ),
//           ),

//           //Event Info
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),

//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.calendar_today,
//                         color: Colors.white,
//                         size: 16,
//                       ),
//                       const SizedBox(width: 6),
//                       Text(date, style: const TextStyle(color: Colors.white)),
//                     ],
//                   ),
//                   const SizedBox(height: 6),
//                   Row(
//                     children: [
//                       const Icon(Icons.person, color: Colors.white, size: 16),
//                       const SizedBox(width: 6),
//                       Text(artist, style: const TextStyle(color: Colors.white)),
//                     ],
//                   ),
//                   const SizedBox(height: 6),
//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.door_front_door,
//                         color: Colors.white,
//                         size: 16,
//                       ),
//                       const SizedBox(width: 6),
//                       Text(
//                         'Door Open : $time WIB',
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 16),

//                   const Text(
//                     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie...',
//                     style: TextStyle(color: Colors.white),
//                   ),

//                   const Spacer(),

//                   //Action Button
//                   Row(
//                     children: [
//                       Expanded(
//                         child: OutlinedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           style: OutlinedButton.styleFrom(
//                             side: const BorderSide(color: Colors.purple),
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                           ),
//                           child: const Text(
//                             'Cancel',
//                             style: TextStyle(color: Colors.purple),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             //Buatkan untuk Reservasi ya
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const ChooseSeatPage(),
//                               ),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.purple,
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                           ),
//                           child: const Text(
//                             'Proceed Reservation',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
