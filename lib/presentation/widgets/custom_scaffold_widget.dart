import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Color backgroundColor;
  final bool hasAppBar;
  final bool hasPadding;

  const CustomScaffold({
    Key? key,
    this.appBar,
    required this.body,
    this.backgroundColor = Colors.white,
    this.hasAppBar = true,
    this.hasPadding = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hasAppBar ? appBar : null,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: hasPadding
          ? Padding(
              padding: const EdgeInsets.only(
                top: 0,
                bottom: 20,
                left: 30,
                right: 30,
              ),
              child: body,
            )
          : body,
    );
  }
}
