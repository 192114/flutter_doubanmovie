import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_douban/HotMovieData.dart';
import 'package:flutter_douban/HotMovieItemWidget.dart';
import 'package:http/http.dart' as http;

class HotMoviesListWidget extends StatefulWidget {
  String curCity ;

  HotMoviesListWidget(String city){
    curCity = city;
  }
  @override
  State<StatefulWidget> createState() {
    return HotMoviesListWidgetState();
  }
}

// AutomaticKeepAliveClientMixin 不回收内存 tab切换时 不重新请求数据

class HotMoviesListWidgetState extends State<HotMoviesListWidget> with AutomaticKeepAliveClientMixin {
  List<HotMovieData> hotMovies = new List<HotMovieData>();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    List<HotMovieData> serverDataList = new List();
    var response = await http.get('https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city='+ widget.curCity +'&start=0&count=10');
    //成功获取数据
    if (response.statusCode == 200) {
      print(response.body);
      var responseJson = json.decode(response.body);
      for (dynamic data in responseJson['subjects']) {
        HotMovieData hotMovieData = HotMovieData.fromJson(data);
        serverDataList.add(hotMovieData);
      }
      setState(() {
        if (mounted) {
          hotMovies = serverDataList;
        }
      });
    } 
  }

  @override
  void didUpdateWidget(HotMoviesListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 切换城市 更新列表
    if (oldWidget.curCity != widget.curCity) {
      // loading
      setState(() {
        hotMovies = [];
      });

      _getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (hotMovies == null || hotMovies.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.separated(
        itemCount: hotMovies.length,
        itemBuilder: (context, index) {
          return HotMovieItemWidget(hotMovies[index]);
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
            color: Colors.black26,
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}