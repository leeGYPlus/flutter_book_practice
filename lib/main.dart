import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import './loading.dart';
import './search.dart';
import './app.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mDefaultTheme,
      title: "聊天室",
      home: LoadingPage(),
      routes: <String, WidgetBuilder>{
        "app": (BuildContext context) => new App(),
        "/friends": (_) => new WebviewScaffold(
              url: "https://flutter.io/",
              appBar: new AppBar(
                title: new Text("Flutter 官网"),
              ),
              withZoom: true,
              withLocalStorage: true,
            ),
        "search": (BuildContext context) => new Search(),
      },
    );
  }
}



final ThemeData mDefaultTheme =  ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Color(0xFFebebeb),
    cardColor: Colors.green);