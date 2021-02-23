import 'package:flutter_custom_control/service/common_service.dart';
import 'package:flutter_custom_control/service/config.dart';

//获取表单模板数据
queryFrmTemplate() async {
  Map<String, dynamic> queryParameters = {};
  return await get(Config.getFrmtemplate, queryParameters: queryParameters);
}
