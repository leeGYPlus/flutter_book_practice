import 'package:flutter/material.dart';
import './contacts_vo.dart';
import 'package:flutter/rendering.dart';

class ContactSiderList extends StatefulWidget {
  final List<ContactVO> items;

  // 好友表头构造器
  final IndexedWidgetBuilder headBuilder;

  // 好友列表构造器
  final IndexedWidgetBuilder itemBuilder;

  // 字母构造器
  final IndexedWidgetBuilder sectionBuilder;

  ContactSiderList(
      {Key key2,
      @required this.items,
      this.headBuilder,
      @required this.itemBuilder,
      @required this.sectionBuilder})
      : super(key: key2);

  @override
  _ContactSiderListState createState() => _ContactSiderListState();
}

class _ContactSiderListState extends State<ContactSiderList> {
  final ScrollController _scrollController = ScrollController();

  bool _onNotification(ScrollNotification notification) {
    return true;
  }

  // 判断显示头部或者空容器
  _isShowHeaderView(index) {
    if (index == 0 && widget.headBuilder != null) {
      return Offstage(
        offstage: false,
        child: widget.headBuilder(context, index),
      );
    }
    return Container();
  }

  // 根据定位判断是否显示好友列表
  bool _shouldShowHeader(int position) {
    if (position <= 0) {
      return false;
    }
    if (position != 0 &&
        widget.items[position].seationKey !=
            widget.items[position - 1].seationKey) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          NotificationListener(
            onNotification: _onNotification,
            child: ListView.builder(
                controller: _scrollController,
                // 列表里面的内容不足一屏时，列表也可以滑动
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: widget.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        // 显示列表头
                        _isShowHeaderView(index),
                        Offstage(
                          offstage: _shouldShowHeader(index),
                          child: widget.sectionBuilder(context, index),
                        ),
                        // 显示列表项
                        Column(
                          children: <Widget>[
                            widget.itemBuilder(context, index)
                          ],
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
