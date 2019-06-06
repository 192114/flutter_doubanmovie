import 'package:flutter/material.dart';

class MovieWidget extends StatefulWidget {
  @override
  State<MovieWidget> createState() {
    return _MovieWidgetState();
  }
}

class _MovieWidgetState extends State<MovieWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 80,
          padding: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.bottomCenter,
          child: TextField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
                hintText: '\uE8b6 电影 / 电视剧 / 影人',
                hintStyle: TextStyle(fontFamily: 'MaterialIcons', fontSize: 16),
                contentPadding: EdgeInsets.only(top: 8, bottom: 8),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                filled: true,
                fillColor: Colors.black12),
          ),
        ),
        Expanded(
          flex: 1,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 50), // 相当于css3 border-box
                  child: TabBar(
                    unselectedLabelColor: Colors.black12,
                    labelColor: Colors.black87,
                    indicatorColor: Colors.black87,
                    tabs: <Widget>[
                      Tab(text: '电影'),
                      Tab(text: '电视'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: TabBarView(
                      children: <Widget>[
                        Center(
                          child: Text('电影'),
                        ),
                        Center(
                          child: Text('电视'),
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
