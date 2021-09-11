import 'package:flutter/material.dart';
import 'package:location_leo/widgets/scaffold/app_bar_widgets.dart';
import 'package:location_leo/widgets/scaffold/loading.dart';

class ScaffoldPrimary extends StatelessWidget {
  final Widget titleWidget;
  final Widget child;
  final Widget leading;
  final bool isLoading;
  final Widget widgetAction;
  final bool isAction;
  final Widget widget;
  final Widget bottomWidget;
  final Widget floatingActionButton;

  const ScaffoldPrimary({
    Key key,
    @required this.titleWidget,
    @required this.child,
    this.isLoading = false,
    this.leading,
    this.widgetAction,
    this.widget,
    this.bottomWidget,
    this.floatingActionButton,
    this.isAction = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        titleWidget: titleWidget,
        context: context,
        leading: leading,
        widget: isAction ? widgetAction : Container(),
      ),
      floatingActionButton: floatingActionButton ?? Container(),
      backgroundColor: Colors.grey[100],
      body: Loading(
        isLoading: isLoading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget ?? Container(),
            Expanded(child: child),
            bottomWidget ?? Container(),
          ],
        ),
      ),
    );
  }
}
