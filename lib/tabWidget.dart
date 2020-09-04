import 'package:flutter/material.dart';

import 'appTheme.dart';

class TabWidget extends StatelessWidget {
  bool isFocus;
  String text;
  Function onTap;

  TabWidget(this.text, {this.isFocus, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          margin: EdgeInsets.symmetric(horizontal: 14),
          decoration: isFocus
              ? BoxDecoration(color: AppTheme.buttonBg, borderRadius: BorderRadius.all(Radius.circular(20)))
              : null,
          child: Center(
              child: Text(
            text,
            style: isFocus ? AppTheme.focusTab : AppTheme.normalTab,
          )),
        ),
      ),
    );
  }
}
