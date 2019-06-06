import 'package:flutter/material.dart';

class HotWidget extends StatefulWidget {
  @override
  State<HotWidget> createState() {
    return _HotWidgetState();
  }
}

class _HotWidgetState extends State<HotWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 80.0,
          padding: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.bottomCenter,
          child: Row(
            children: <Widget>[
              Text('大连',
                  style: TextStyle(
                    fontSize: 16,
                  )),
              Icon(Icons.arrow_drop_down),
              Expanded(
                flex: 1,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                      hintText: '\uE8b6 电影 / 电视剧 / 影人',
                      hintStyle:
                          TextStyle(fontFamily: 'MaterialIcons', fontSize: 16),
                      contentPadding: EdgeInsets.only(top: 8, bottom: 8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      filled: true,
                      fillColor: Colors.black12),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 50),
                  child: TabBar(
                      unselectedLabelColor: Colors.black12, // 未选中时label颜色
                      labelColor: Colors.black87, // 选中label的颜色
                      indicatorColor: Colors.black87, // 选中label下面线的颜色
                      tabs: <Widget>[Tab(text: '正在热映'), Tab(text: '即将上映')]),
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                      children: <Widget>[
                        Center(
                          child: Text('正在热映'),
                        ),
                        Center(
                          child: Text('即将上映'),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
