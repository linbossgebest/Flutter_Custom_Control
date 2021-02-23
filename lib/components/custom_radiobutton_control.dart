import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomRadioButtonControl extends StatefulWidget {
  final dynamic data;
  CustomRadioButtonControl({Key key, this.data}) : super(key: key);

  @override
  _CustomRadioButtonControlState createState() =>
      _CustomRadioButtonControlState();
}

class _CustomRadioButtonControlState extends State<CustomRadioButtonControl> {
  var data;
  List<String> controlItems;
  List itemlist;
  String radioButtonValue;
  int groupValue;

  @override
  void initState() {
    super.initState();

    data = widget.data;
    controlItems = new List<String>();
    itemlist = data["control_item"];
    itemlist.forEach((element) {
      controlItems.add(element["name"]);

      //设置默认选中值
      if (element["defaults"].toString().contains("1")) {
        radioButtonValue = element["name"];
      }
    });
    if (radioButtonValue==null||radioButtonValue.isEmpty) {
      radioButtonValue = controlItems[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: _radionButtonItems()),
    );
  }

  _radionButtonItems() {
    return controlItems.map<Widget>((String value) {
      return Container(
        child: RadioListTile(
          title: Text("$value"),
          value: value,
          groupValue: radioButtonValue,
          onChanged: (val) {
            setState(() {
              radioButtonValue = val;
            });
          },
        ),
      );
    }).toList();
  }
}
