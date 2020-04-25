import 'package:app/views/chat/chat_view.dart';
import 'package:app/views/projects/projects_view.dart';
import 'package:flutter/material.dart';

import './activity/activity_view.dart';
import './profile/profile_view.dart';
import '../widgets/adaptive_scaffold.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': ActivityView(),
        'title': 'Futuring',
      },
      {
        'page': ProjectsView(),
        'title': 'Challanges',
      },
      {
        'page': ProfileView(),
        'title': 'Profile',
      },
      {
        'page': ChatView(),
        'title': 'Chat',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      title: _pages[_selectedPageIndex]['title'],
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.home),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.call_to_action),
            title: Text('Projects'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.bubble_chart),
            title: Text('Chat'),
          ),
        ],
      ),
    );
  }
}
