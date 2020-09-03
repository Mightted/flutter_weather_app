import 'package:flutter/material.dart';


class BasePage extends StatelessWidget {
  Widget child;
  String title;

  BasePage({this.child, this.title = "Flutter Demo"});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF191481)),
        leading: Icon(Icons.menu),
        title: Center(
          child: Text(
            title,
            style: TextStyle(color: Color(0xFF191481)),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.search, size: 28),
          )
        ],
      ),
      body: SizedBox(height:MediaQuery.of(context).size.height,child: child),
    );
  }
}