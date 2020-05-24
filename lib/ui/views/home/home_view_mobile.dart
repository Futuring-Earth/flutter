import 'package:app/ui/views/activity/activity_view.dart';
import 'package:app/ui/views/chat/search_page.dart';
import 'package:app/ui/views/inspiration/inspiration_view.dart';
import 'package:app/ui/views/challenges/challenges_view.dart';
import 'package:app/ui/views/profile/profile_appdrawer.dart';
import 'package:app/ui/views/profile/profile_view.dart';
// import 'package:app/ui/views/sketch/home/homeview.dart';
import 'package:app/ui/views/sketch/onboarding/onboarding1_view.dart';
import 'package:app/ui/widgets/adaptive_scaffold.dart';
import 'package:flutter/material.dart';

class HomeViewMobile extends StatefulWidget {
  @override
  _HomeViewMobileState createState() => _HomeViewMobileState();
}

class _HomeViewMobileState extends State<HomeViewMobile> {
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
        'page': ChallengesView(),
        'title': 'My Active Challanges',
      },
      {
        'page': ProfileView(),
        'title': 'Profile',
      },
      {
        'page': InspirationView(),
        'title': 'Community',
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
    // final mediaQuery = MediaQuery.of(context);
    // final height= mediaQuery.size.height -
    //         Scaffold.of(context).appBarMaxHeight -
    //         mediaQuery.padding.top,

    return AdaptiveScaffold(
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            // NavigationService.instance.pushNamed(EditChallengesView.routeName);
            Navigator.of(context).pushNamed(Onboarding1Widget.routeName);
          },
        ),
        IconButton(
          icon: const Icon(Icons.chat_bubble_outline),
          onPressed: () {
            Navigator.of(context).pushNamed(SearchPage.routeName);
            //ExtendedNavigator.of(context).pushNamed(Routes.searchPageRoute);
            //CustomNavigationService.instance.pushNamed(Routes.searchPageRoute);
          },
        )
      ],
      title: _pages[_selectedPageIndex]['title'],
      body: _pages[_selectedPageIndex]['page'],
      drawer: _selectedPageIndex == 2 ? ProfileDrawer() : null,
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
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.call_to_action),
            title: Text('My Active Challanges'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.bubble_chart),
            title: Text('Community'),
          ),
        ],
      ),
    );
  }
}
