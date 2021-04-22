import 'package:dio/dio.dart';

class DioHttp {
  //取消请求
  final CancelToken _cancelToken = CancelToken();

  Future<Response> get() async {
    Dio _dio = Dio()..interceptors.add(LogInterceptor());
    Response response = await _dio.get(
        'https://github.com/781238222/flutter-do/blob/master/README.md',
        cancelToken: _cancelToken);
    print(response.data.toString());
    //方式二
    response = await Dio().get("https://xxx.com/test",
        queryParameters: {'name': 'laomeng', 'page': 1});
    return response;
  }

  Future<Response> post() async {
    Response response = await Dio().post("https://xxx.com/test",
        queryParameters: {'name': 'laomeng', 'page': 1});
    return response;
  }

  Future<Response> postFrom() async {
    var formData = FormData.fromMap({
      "name": "laomeng",
      "page": 1,
    });
    Response response =
        await Dio().post('https://xxx.com/test', data: formData);
    return response;
  }

  Future<Response> postFile() async {
    var formData = FormData.fromMap({
      'name': 'laomeng',
      'file':
          await MultipartFile.fromFile("./text.txt", filename: "upload.txt"),
      'files': [
        await MultipartFile.fromFile("./text1.txt", filename: "text1.txt"),
        await MultipartFile.fromFile("./text2.txt", filename: "text2.txt"),
      ]
    });
    Response response = await Dio().post(
      'https://xxx.com/test',
      data: formData,
      onSendProgress: (int sent, int total) {
        //上传进度
        print("$sent $total");
      },
    );
    return response;
  }
}

class MyInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("onError: ${err.message}");
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("onResponse: ${response.realUri.toString()}");
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("onRequest: ${options.uri.toString()}");
  }
}
