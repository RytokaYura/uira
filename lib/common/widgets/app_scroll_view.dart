import 'package:flutter/material.dart';

class AppScrollView extends StatelessWidget {
  final List<Widget>? content;
  const AppScrollView({super.key, this.content});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: content ?? [],
      ),
    );
  }
}
