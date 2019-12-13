import 'package:flutter/material.dart';
import './touch_callback.dart';

class ImItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Icon icon;

  ImItem(
      {Key key,
      @required this.title,
      @required this.imageUrl,
      @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchCallBack(
      onPressed: () {
        switch (title) {
          case '好友动态':
            Navigator.pushNamed(context, '/friends');
            break;
          case '联系客服':
            break;
        }
      },
      child: Container(
        height: 50.0,
        child: Row(
          children: <Widget>[
            Container(
                child: imageUrl != null
                    ? Image.asset(imageUrl, width: 32.0, height: 32.0)
                    : SizedBox(
                        height: 32.0,
                        width: 32.0,
                        child: icon,
                      ),
                margin: const EdgeInsets.only(left: 22.0, right: 22.0)),
            Text(
              title,
              style: TextStyle(fontSize: 16.0, color: Color(0xff353535)),
            )
          ],
        ),
      ),
    );
  }
}
