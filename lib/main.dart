import 'package:flutter/material.dart';
import 'package:flutter_douban/CitysWidget.dart';
import 'package:flutter_douban/HotWidget.dart';
import 'package:flutter_douban/MovieWidget.dart';
import 'package:flutter_douban/MineWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣电影',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '豆瓣电影'),
      routes: {
        '/Citys': (context) => CitysWidget(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final _bodyItems = [
    HotWidget(),
    MovieWidget(),
    MineWidget()
  ];

  void _tapBottomBarHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _bodyItems[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('热映')),
          BottomNavigationBarItem(icon: Icon(Icons.panorama_fish_eye), title: Text('找片')),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('我的'))
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.black, //选中时颜色变为黑色
        type: BottomNavigationBarType.fixed,//类型为 fixed,
        onTap: _tapBottomBarHandler,
      ),
    );
  }
}
