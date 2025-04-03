// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   // List of pages
//   final List<Widget> _pages = [
//     Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Refer Page', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Menu Page', style: TextStyle(fontSize: 24))),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Navigation Bar Example')),
//       body: _pages[_selectedIndex], // Display selected page
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_add),
//             label: 'Refer',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu),
//             label: 'Menu',
//           ),
//         ],
//       ),
//     );
//   }
// }
