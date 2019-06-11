import 'package:flutter/material.dart';
import 'package:flutter_douban/HotMoviesListWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HotWidget extends StatefulWidget {
  @override
  State<HotWidget> createState() {
    return _HotWidgetState();
  }
}

class _HotWidgetState extends State<HotWidget> {
  String curCity;

  void initState() {
    super.initState();
    print('HotWidgetState initState');
    initData();
  }
  
  void initData() async {
    // shared_preferences 读取本地数据
    final prefs = await SharedPreferences.getInstance();//获取 prefs

    String city = prefs.getString('curCity');//获取 key 为 curCity 的值

    if (city != null && city.isNotEmpty) { //如果有值
      setState((){
        curCity = city;
      });
    } else {//如果没有值，则使用默认值
      setState((){
        curCity = '大连';
      });
    }
  }

  void _jumpToCitysWidget() async{
    var selectCity = await Navigator.pushNamed(context, '/Citys',arguments: curCity);
    if(selectCity == null) return;
    // shared_preferences将本地数据写入
    final prefs = await SharedPreferences.getInstance(); 
    prefs.setString('curCity', selectCity); //存取数据
    setState(() {
      curCity =  selectCity;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (curCity == null || curCity.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 80.0,
          padding: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.bottomCenter,
          child: Row(
            children: <Widget>[
              GestureDetector(
                child: Text(curCity,
                    style: TextStyle(
                      fontSize: 16,
                    )),
                onTap: () {
                  _jumpToCitysWidget();
                },
              ),
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
                        HotMoviesListWidget(curCity),
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
