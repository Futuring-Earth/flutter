import 'package:app/core/models/user.dart';
import 'package:app/core/services/conversation_db_Service.dart';
import 'package:app/core/services/user_db_Service.dart';
import 'package:app/ui/views/chat/Conversation_view.dart';
import 'package:app/ui/widgets/adaptive_scaffold.dart';
import 'package:app/ui/widgets/auth_wrapper.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:timeago/timeago.dart' as timeago;

class SearchPage extends StatefulWidget {
  static const routeName = '/Search_page';

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  double _height;
  double _width;
  String _searchText;
  User _user;

  _SearchPageState() {
    _searchText = '';
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double _height = mediaQuery.size.height -
        //Scaffold.of(context).appBarMaxHeight -
        mediaQuery.padding.top;
    final double _width = mediaQuery.size.width;
    return AdaptiveScaffold(
      title: 'Conversations',
      body: Container(
        color: Theme.of(context).backgroundColor,
        height: _height,
        width: _width,
        child: AuthWrapper(
            innerWidget: _searchPageUI,
            user: null,
            height: _height,
            width: _width),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   _height = MediaQuery.of(context).size.height;
  //   _width = MediaQuery.of(context).size.width;
  //   return Container(
  //     child: FutureBuilder<User>(
  //       future: Provider.of<AuthService>(context, listen: false).currentUser(),
  //       builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
  //         if (snapshot.hasData) {
  //           _user = snapshot.data;
  //           return _searchPageUI();
  //         } else {
  //           return SpinKitWanderingCubes(
  //             color: Theme.of(context).accentColor,
  //             size: 50.0,
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }

  Widget _searchPageUI(
      BuildContext ctx, User user, double height, double width) {
    _height = height;
    _width = width;
    _user = user;
    return Builder(
      builder: (BuildContext _context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _userSearchField(),
            _usersListView(),
          ],
        );
      },
    );
  }

  Widget _userSearchField() {
    return Container(
      height: this._height * 0.08,
      width: this._width,
      padding: EdgeInsets.symmetric(vertical: this._height * 0.02),
      child: TextField(
        autocorrect: false,
        style: TextStyle(color: Colors.white),
        onSubmitted: (_input) {
          setState(() {
            _searchText = _input;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          labelStyle: TextStyle(color: Colors.white),
          labelText: "Search",
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _usersListView() {
    return StreamBuilder<List<User>>(
      stream:
          FirestoreUserDBService.instance.usersStream(searchText: _searchText),
      builder: (_context, _snapshot) {
        var _usersData = _snapshot.data;
        if (_usersData != null) {
          _usersData.removeWhere((_contact) => _contact.id == _user.uid);
        }
        return _snapshot.hasData
            ? Container(
                height: this._height * 0.75,
                child: ListView.builder(
                  itemCount: _usersData.length,
                  itemBuilder: (BuildContext _context, int _index) {
                    var _userData = _usersData[_index];
                    var _currentTime = DateTime.now();
                    var _recepientID = _usersData[_index].id;
                    var _isUserActive = !_userData.lastSeen.isBefore(
                      _currentTime.subtract(
                        Duration(hours: 1),
                      ),
                    );
                    return ListTile(
                      onTap: () {
                        FirestoreConversationDBService.instance
                            .createOrGetConversartion(_user.uid, _recepientID,
                                (String _conversationID) {
                          return Navigator.of(context).push(
                            MaterialPageRoute(builder: (_context) {
                              return ConversationView(
                                  _conversationID,
                                  _recepientID,
                                  _userData.displayName,
                                  _userData.photoUrl);
                            }),
                          );
                        });
                      },
                      title: Text((_userData.displayName == null)
                          ? 'Anonymous'
                          : _userData.displayName),
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage((_userData.photoUrl != null)
                                  ? _userData.photoUrl
                                  : '')),
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          _isUserActive
                              ? Text(
                                  "Active Now",
                                  style: TextStyle(fontSize: 15),
                                )
                              : Text(
                                  "Last Seen",
                                  style: TextStyle(fontSize: 15),
                                ),
                          _isUserActive
                              ? Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                )
                              : Text(
                                  timeago.format(
                                    _userData.lastSeen,
                                  ),
                                  style: TextStyle(fontSize: 15),
                                ),
                        ],
                      ),
                    );
                  },
                ),
              )
            : SpinKitWanderingCubes(
                color: Colors.blue,
                size: 50.0,
              );
      },
    );
  }
}
