import 'package:flutter/material.dart';
import 'package:instructme/calendar.dart';
import 'package:instructme/classes_groups.dart';
import 'package:instructme/dashboard.dart';
import 'package:instructme/group.dart';
import 'package:instructme/messages.dart';
import 'package:instructme/notifications.dart';
// import 'package:instructme/old_calendar.dart';
import 'package:instructme/profile.dart';
import 'package:instructme/utils/theme.dart';

void main() {
  runApp(const InstructMeApp());
}

class InstructMeApp extends StatelessWidget {
  const InstructMeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'instruct.me',
      theme: ThemeData(
          primaryColor: THEME_PRIMARY,
          appBarTheme: const AppBarTheme(backgroundColor: THEME_PRIMARY)),
      home: const MyHomePage(title: 'instruct.me'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _routesList = <Widget>[
    NewCalendarPage(),
    // OldCalendarPage(),
    DashboardPage(),
    ClassesGroupsPage(),
    MessagesPage(),
    NotificationsPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void goToGroup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GroupPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _routesList.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_outlined),
            label: 'Classes/Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_outlined),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: THEME_SECONDARY,
        selectedItemColor: THEME_PRIMARY,
        onTap: _onItemTapped,
      ),
    );
  }
}
