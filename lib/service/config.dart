class Config {
  static const ipAddress = "http://192.168.6.126:13322/api";

  //获取表单模板数据
  static const String getFrmtemplate = ipAddress + "/App/GetFrmtemplate";

  //获取流程进度
  static const String getFlowProcess = ipAddress + "/App/GetFlowProcess";

   //获取流程图
  static const String getFlowCharts = ipAddress + "/App/GetFlowCharts";
}
