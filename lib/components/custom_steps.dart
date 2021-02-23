import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_control/util/common.dart';
import 'package:steps/steps.dart';

class CustomSteps extends StatefulWidget {
  CustomSteps({Key key}) : super(key: key);

  @override
  _CustomStepsState createState() => _CustomStepsState();
}

class _CustomStepsState extends State<CustomSteps> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: getJsonData('lib/data/process_operation.json', context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<dynamic> data = json.decode(snapshot.data.toString());
                return Steps(
                    direction: Axis.vertical,
                    size: 16.0,
                    path: {'color': Colors.lightBlue.shade200, 'width': 3.0},
                    steps: _initSteps(data));
              } else {
                return Container(
                  child: Text("no data"),
                );
              }
            }));
  }

  //初始化steps
  List<dynamic> _initSteps(data) {
    List<dynamic> steps = new List<dynamic>();

    for (var i = 0; i < data.length; i++) {
      dynamic step = {
        'color': Colors.white,
        'background': Colors.lightBlue.shade200,
        'label': (i + 1).toString(),
        'content': Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${data[i]["content"]}",
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                "处理意见：${data[i]["result"] == "1" ? "同意" : "驳回"}",
                style: TextStyle(fontSize: 12.0),
              ),
              Text(
                '处理人：${data[i]["creator"]}',
                style: TextStyle(fontSize: 12.0),
              ),
              Text(
                '处理时间：${data[i]["createdate"]}',
                style: TextStyle(fontSize: 12.0),
              ),
            ])
      };
      steps.add(step);
    }
    return steps;
  }
}
