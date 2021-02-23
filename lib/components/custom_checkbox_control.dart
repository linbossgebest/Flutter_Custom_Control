import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCheckBoxControl extends StatefulWidget {
  final dynamic data;
  CustomCheckBoxControl({Key key, this.data}) : super(key: key);

  @override
  _CustomCheckBoxControlState createState() => _CustomCheckBoxControlState();
}

class _CustomCheckBoxControlState extends State<CustomCheckBoxControl> {
  var data;
  List<String> controlItems;
  List itemlist;
  List<bool> checkedList;

  @override
  void initState() {
    super.initState();

    data = widget.data;
    controlItems = new List<String>();
    checkedList=new List<bool>();
    itemlist = data["control_item"];
    itemlist.forEach((element) {
      controlItems.add(element["name"]);
      //设置默认选中值
      if(element["defaults"].toString().contains("0")){
        checkedList.add(false);
      }else{
        checkedList.add(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: _checkBoxItems()),
    );
  }

  _checkBoxItems(){
    return controlItems.map<Widget>((String value){
      int index= controlItems.indexOf(value);
      return Container(
        child: CheckboxListTile(
          title: Text("$value"),
          value: checkedList[index],
          onChanged: (value){
            setState(() {
              _updateCheckboxStatus(index,value);
            });
          },
        ),
      );
    }).toList();
  }

   void _updateCheckboxStatus(int position,bool isCheck){
    setState(() {
      checkedList[position]=isCheck;
    });
  }
}
