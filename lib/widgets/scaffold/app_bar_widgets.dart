import 'package:flutter/material.dart';
import 'package:location_leo/style/app_colors.dart';

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
            backgroundColor: AppColors.primaryColor,
            title: titleWidget,
            centerTitle: true,
            leading: leading,
            actions: [widget],
          ),
        );
}
