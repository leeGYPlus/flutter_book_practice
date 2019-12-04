import 'package:flutter/material.dart';
import './chat/message_page.dart';
import './contacts/contacts.dart';
import './personal/personal.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var _currentIndex = 0;

  MessagePage message;
  Contacts contacts;
  Personal personal;

  currentPage() {
    switch (_currentIndex) {
      case 0:
        if (message == null) {
          message = MessagePage();
        }
        return message;

      case 1:
        if (contacts == null) {
          contacts = Contacts();
        }
        return contacts;
      case 1:
        if (personal == null) {
          personal = Personal();
        }
        return personal;
      default:
    }
  }

  // 渲染某个菜单项，传入菜单标题，图片路径或者图标
  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
        child: Row(
      children: <Widget>[
        imagePath != null
            ? Image.asset(
                imagePath,
                width: 32.0,
                height: 32.0,
              )
            : SizedBox(
                width: 32.0,
                height: 32.0,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
        Container(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("即时通讯"),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 20.0),
            child: GestureDetector(
              onTap: () {
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 10.0),
                    items: <PopupMenuEntry>[
                      _popupMenuItem('发起会话',
                          imagePath: 'images/icn_menu_group.png'),
                      _popupMenuItem('添加好友',
                          imagePath: 'images/icn_menu_add_friends.png'),
                      _popupMenuItem('联系客服', icon: Icons.people),
                    ]);
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              title: Text(
                "聊天",
                style: TextStyle(
                    color: _currentIndex == 0
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 0
                  ? Image.asset('images/message_pressed.png',
                      width: 32.0, height: 28.0)
                  : Image.asset(
                      'images/message_normal.png',
                      width: 32.0,
                      height: 28.0,
                    )),
          BottomNavigationBarItem(
              title: Text(
                "好友",
                style: TextStyle(
                    color: _currentIndex == 1
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 1
                  ? Image.asset('images/contact_list_pressed.png',
                      width: 32.0, height: 28.0)
                  : Image.asset(
                      'images/contact_list_normal.png',
                      width: 32.0,
                      height: 28.0,
                    )),
          BottomNavigationBarItem(
              title: Text(
                "我的",
                style: TextStyle(
                    color: _currentIndex == 2
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 2
                  ? Image.asset('images/profile_pressed.png',
                      width: 32.0, height: 28.0)
                  : Image.asset(
                      'images/profile_normal.png',
                      width: 32.0,
                      height: 28.0,
                    ))
        ],
      ),
      body: currentPage(),
    );
  }
}
