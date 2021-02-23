import 'package:flutter/material.dart';

//根据path获取json信息
Future<String> getJsonData(path, context) {
  return DefaultAssetBundle.of(context).loadString(path);
}
