import 'package:flutter/material.dart';

@immutable
class AppBarWidget extends PreferredSize {
  AppBarWidget({
    Key key,
    Widget leading,
    Function leadingOnTap,
    BuildContext context,
    @required Widget widget,
    @required Widget titleWidget,
  }) : super(
          key: key,
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(
            backgroundColor: Colors.blue[900],
            title: titleWidget,
            centerTitle: true,
            leading: leading,
            actions: [widget],
          ),
        );
}
