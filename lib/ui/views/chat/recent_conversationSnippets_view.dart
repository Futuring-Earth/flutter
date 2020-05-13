import 'package:app/core/models/conversationsnippet.dart';
import 'package:app/core/models/message.dart';
import 'package:app/core/models/user.dart';
import 'package:app/core/services/conversation_snippet_db_Service.dart';
import 'package:app/ui/views/chat/Conversation_view.dart';
import 'package:app/ui/widgets/adaptive_scaffold.dart';
import 'package:app/ui/widgets/auth_wrapper.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:timeago/timeago.dart' as timeago;

class RecentConversationSnippetsView extends StatelessWidget {
  static const routeName = '/recent_conversations';

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
            innerWidget: _conversationsListViewWidget,
            user: null,
            height: _height,
            width: _width),
      ),
    );
  }

  Widget _conversationsListViewWidget(
      BuildContext ctx, User user, double height, double width) {
    return Builder(
      builder: (BuildContext _context) {
        return Container(
          height: height,
          width: width,
          child: StreamBuilder<List<ConversationSnippet>>(
            stream: FirestoreConversationSnippetDBService.instance
                .conversationSnippetsStream(user.uid),
            builder: (_context, _snashot) {
              var _data = _snashot.data;
              if (_data != null) {
                _data.removeWhere((_c) {
                  return _c.timestamp == null;
                });
                return _data.length != 0
                    ? ListView.builder(
                        itemCount: _data.length,
                        itemBuilder: (_context, _index) {
                          return ListTile(
                            onTap: () {
                              Navigator.of(ctx).push(
                                MaterialPageRoute(
                                  builder: (BuildContext _context) {
                                    return ConversationView(
                                        _data[_index].connversationId,
                                        _data[_index].id,
                                        _data[_index].name,
                                        _data[_index].photoUrl);
                                  },
                                ),
                              );
                            },
                            title: Text(_data[_index].name),
                            subtitle: Text(
                                _data[_index].type == MessageType.Text
                                    ? _data[_index].lastMessage
                                    : "Attachment: Image"),
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(_data[_index].photoUrl),
                                ),
                              ),
                            ),
                            trailing: _listTileTrailingWidgets(
                                _data[_index].timestamp),
                          );
                        },
                      )
                    : Align(
                        child: Text(
                          "No Conversations Yet!",
                          style:
                              TextStyle(color: Colors.white30, fontSize: 15.0),
                        ),
                      );
              } else {
                return SpinKitWanderingCubes(
                  color: Colors.blue,
                  size: 50.0,
                );
              }
            },
          ),
        );
      },
    );
  }

  Widget _listTileTrailingWidgets(DateTime _lastMessageTimestamp) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          "Last Message",
          style: TextStyle(fontSize: 15),
        ),
        Text(
          timeago.format(_lastMessageTimestamp),
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
