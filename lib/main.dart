import 'dart:convert';

import 'package:flutter/material.dart';
import 'model/control_model.dart';
import 'components/custom_textbox_control.dart';
import 'components/custom_dropdown_control.dart';
import 'components/custom_radiobutton_control.dart';
import 'components/custom_checkbox_control.dart';
import 'components/custom_datetime_control.dart';
import 'components/custom_filepick_control.dart';
import 'util/common.dart';
import 'components/custom_steps.dart';
import 'components/custom_flowcharts.dart';
import 'service/control_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.standard,
      ),
      home: DemoPage(title: '自定义控件+数据流转显示'),
      //home:LearnRadioButton(),
    );
  }
}

class DemoPage extends StatefulWidget {
  DemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage>
    with SingleTickerProviderStateMixin {
  List<CustomControlModel> customControlList;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        new TabController(length: 3, vsync: this); //固定写法，length为tab数
  }

  Future getFrmTemplate() async {
    return queryFrmTemplate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "数据"),
              Tab(text: "动态"),
              Tab(text: "流转图"),
            ],
            controller: _tabController, // 记得要带上tabController
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(
              child: FutureBuilder(
                  // future: DefaultAssetBundle.of(context)
                  //     .loadString('lib/data/custom_control.json'),
                  //future: getJsonData('lib/data/custom_control.json', context),
                  future: getFrmTemplate(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<dynamic> data = json.decode(snapshot
                          .data["resultdata"][1]["frmContent"]
                          .toString());

                      return new ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _control(data[index]);
                          });
                    } else {
                      return Container(
                        child: Text('no data'),
                      );
                    }
                  }),
            ),
            Center(
              child: CustomSteps(),
            ),
            Center(child: CustomFlowCharts()),
          ],
        ));
  }

  Widget _control(data) {
    return Container(
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: new Border.all(width: 1.0, color: Colors.black),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Text(
                "${data['control_label']}:",
                style: TextStyle(fontSize: 16),
              )),
          Expanded(flex: 3, child: _custom(data)),
        ],
      ),
    );
  }

  // ignore: missing_return
  Widget _custom(data) {
    String type = "${data['control_type']}";
    switch (type) {
      case "text":
        return Container(child: CustomTextBoxControl(data: data));
        break;
      case "textarea":
        return Container(child: CustomTextBoxControl(data: data));
        break;
      case "select":
        return Container(child: CustomDropDownControl(data: data));
        break;
      case "radio":
        return Container(child: CustomRadioButtonControl(data: data));
        break;
      case "checkbox":
        return Container(child: CustomCheckBoxControl(data: data));
        break;
      case "datetime"://日期控件
        return Container(child: CustomDateTimeControl());
        break;
      case "upload"://上传文件
        return Container(child: FilePickerDemo());
        break;
      case "image"://上传图片
        return Container(child: FilePickerDemo());
        break;
      default:
        return Container(
          child: Text('暂不支持此控件'),
        );
    }
  }
}
