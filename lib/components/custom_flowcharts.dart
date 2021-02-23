import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_control/util/common.dart';

class CustomFlowCharts extends StatefulWidget {
  CustomFlowCharts({Key key}) : super(key: key);

  @override
  _CustomFlowChartsState createState() => _CustomFlowChartsState();
}

class _CustomFlowChartsState extends State<CustomFlowCharts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: EdgeInsets.all(6),
      child: FutureBuilder(
        future: getJsonData('lib/data/flow_charts.json', context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> data = json.decode(snapshot.data.toString());
            return ListView(
              children: _initFlowDatas(data),
            );
          } else {
            return Container(
              child: Text("no data"),
            );
          }
        },
      ),
    );
  }

  //初始化流程图
  List<Widget> _initFlowDatas(data) {
    List<Widget> widgetList = new List<Widget>();
    for (var i = 0; i < data.length; i++) {
      var row = new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _rowContainers(data[i]["nodes"]));
      widgetList.add(row);
      if (i < data.length - 1) {
        widgetList.add(Icon(Icons.arrow_downward));
      }
    }

    return widgetList;
  }

  //动态生成Row的children
  List<Widget> _rowContainers(data) {
    List<Widget> widgetList = new List<Widget>();
    for (var i = 0; i < data.length; i++) {
      var container = _flowContainer(data[i]);
      widgetList.add(container);
    }

    return widgetList;
  }

  //动态生成container
  Container _flowContainer(value) {
    return Container(
      width: 70,
      height: 40,
      decoration: new BoxDecoration(
        color: _flowColor(value["result"]),
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        //设置四周边框
        border: new Border.all(width: 1, color: Colors.white),
      ),
      child: Container(
          alignment: Alignment.center,
          child: Text(
            value["flowname"],
            style: TextStyle(fontSize: 12),
          )),
    );
  }

  //根据result判断颜色 0=>未处理  1=>通过  2=>驳回
  Color _flowColor(value) {
    switch (value) {
      case "0":
        return Colors.grey;
        break;
      case "1":
        return Colors.green.shade300;
        break;
      case "2":
        return Colors.orange;
        break;
      default:
        return Colors.blue.shade200;
    }
  }
}
