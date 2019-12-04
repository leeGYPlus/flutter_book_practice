import 'package:flutter/material.dart';

List<BottomNavigationBarItem> createBottomNavigationBarItemList(int _currentIndex) {
  return <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        title: Text(
          "聊天",
          style: TextStyle(
              color:
                  _currentIndex == 0 ? Color(0xFF46c01b) : Color(0xff999999)),
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
              color:
                  _currentIndex == 1 ? Color(0xFF46c01b) : Color(0xff999999)),
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
              color:
                  _currentIndex == 2 ? Color(0xFF46c01b) : Color(0xff999999)),
        ),
        icon: _currentIndex == 2
            ? Image.asset('images/profile_pressed.png',
                width: 32.0, height: 28.0)
            : Image.asset(
                'images/profile_normal.png',
                width: 32.0,
                height: 28.0,
              ))
  ];
}
