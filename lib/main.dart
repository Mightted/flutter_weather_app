import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'basePage.dart';
import 'mainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          backgroundColor: Colors.white,
          accentColor: Color(0xFF191481),
          iconTheme: IconThemeData(color: Color(0xFF191481)),
          brightness: Brightness.light,
          primaryColor: Colors.white),
      home: MyHomePage(title: 'India, Mumbai'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(child: MainPage(), title: widget.title);
  }
}
