import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextBoxControl extends StatefulWidget {
  final dynamic data;
  CustomTextBoxControl({Key key, this.data}) : super(key: key);

  @override
  _CustomTextBoxControlState createState() => _CustomTextBoxControlState();
}

class _CustomTextBoxControlState extends State<CustomTextBoxControl> {
  var data;
  @override
  void initState() {
    super.initState();
    data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        //textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
        ),
        decoration: InputDecoration(
            hintText: "${data['control_label']}",
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder()),
        onChanged: (value) {},
      ),
    );
  }
}
