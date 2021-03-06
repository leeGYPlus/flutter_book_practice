import 'package:flutter/material.dart';
import './contacts_item.dart';

// 好友列表表头
class ContactHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ContactItem(titleName: "新的好友", imageName: 'images/icon_addfriend.png'),
        ContactItem(titleName: "公共聊天室", imageName: "images/icon_groupchat.png")
      ],
    );
  }
}
