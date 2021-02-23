import 'package:dio/dio.dart';

//公共get方法
get(String url, {Map<String, dynamic> queryParameters}) async {
  try {
    var dio = Dio();

    Response response = await dio.get(url, queryParameters: queryParameters);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      print(response.statusCode);
    }
  } catch (e) {
    print("$e");
  }
}

//公共post方法
post(String url, {Map<String, dynamic> data}) async {
  try {
    var dio = Dio();

    Response response = await dio.post(url, data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      print(response.statusCode);
    }
  } catch (e) {
    print("$e");
  }
}
