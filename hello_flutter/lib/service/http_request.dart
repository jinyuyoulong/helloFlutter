// dart有一个编码规范，文件命名最好是用下划线分割
import 'package:dio/dio.dart';

import 'http_config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseUrl, connectTimeout: HttpConfig.timeout);
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url,
      {
        String method = "get",
        required Map<String, dynamic>  parames,
        required Interceptor inter
      }) async {
    // 1. 创建dio
    // 私有参数配置
    final Options options = Options(method: method);

    final Interceptor defaultInter = InterceptorsWrapper(onRequest: (request, requestInterceptorHandler) {
      print("请求拦截 ");
      print("${request.method} | ${request.path}");
      return requestInterceptorHandler.next(request);
    }, onResponse: (response,responseInterceptorHandler) {
      print("响应拦截");
      print('${response.statusCode} ${response.statusCode} ${response.data}');
      return responseInterceptorHandler.next(response);
    }, onError: (err,handler) {
      print("错误拦截");
      print(err.message);
      return handler.next(err);
    });
    List<Interceptor> iterable = [defaultInter];
    iterable.add(inter);
      // 统一添加到全局拦截中
    dio.interceptors.addAll(iterable);
    // 2. 发送网络请求
    try {
      Response response =
          await dio.request(url, queryParameters: parames, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
