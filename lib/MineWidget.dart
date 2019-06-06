import 'package:flutter/material.dart';

class MineWidget extends StatefulWidget {
  @override
  State<MineWidget> createState() {
    return _HotWidgetState();
  }
}

class _HotWidgetState extends State<MineWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我的')
    );
  }
}