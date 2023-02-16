import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  final Key? key;
  const InitialPage({this.key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First page'),
      ),
    );
  }
}
