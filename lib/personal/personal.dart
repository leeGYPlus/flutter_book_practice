import 'package:flutter/material.dart';
import '../common/touch_callback.dart';
import '../common/im_item.dart';

class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            height: 80.0,
            child: TouchCallBack(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 15.0),
                    child: Image.asset('images/yixiu.jpeg'),
                    width: 70.0,
                    height: 70.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '一休',
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xff353535)),
                        ),
                        Text(
                          '账号',
                          style: TextStyle(
                              fontSize: 14.0, color: Color(0xffa9a9a9)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12.0, right: 15.0),
                    child: Image.asset(
                      'images/code.png',
                      width: 24.0,
                      height: 24.0,
                    ),
                  )
                ],
              ),
              onPressed: (){},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: ImItem(
              title: '好友动态',
              imageUrl: 'images/icon_me_friends.png',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ImItem(
                  imageUrl: 'images/icon_me_message.png',
                  title: '消息管理',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xffd9d9d9),
                  ),
                ),
                ImItem(
                  imageUrl: 'images/icon_me_message.png',
                  title: '消息管理',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xffd9d9d9),
                  ),
                ),
                ImItem(
                  imageUrl: 'images/icon_me_message.png',
                  title: '消息管理',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xffd9d9d9),
                  ),
                ),
                ImItem(
                  imageUrl: 'images/icon_me_message.png',
                  title: '消息管理',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xffd9d9d9),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
