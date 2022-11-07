import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ApiClient {
  static const String TAG = 'ApiClient';

  final Dio _dio = Dio();
  final Dio _tokenDio = Dio();

  ApiClient() {
    _dio.options = BaseOptions(
      //TODO:Add base url here
      baseUrl: '',
      responseType: ResponseType.json,
      connectTimeout: 1000 * 60,
      receiveTimeout: 1000 * 30,
      sendTimeout: 1000 * 45,
    );
    _tokenDio.options = BaseOptions(
      baseUrl: '',
      responseType: ResponseType.json,
      connectTimeout: 1000 * 60,
      receiveTimeout: 1000 * 30,
      sendTimeout: 1000 * 45,
    );
    // _setupAuthInterceptor();
    _setupLoggingInterceptor();
  }

  void _setupLoggingInterceptor() {
    var loginInterceptor = LogInterceptor(
      responseBody: true,
      requestBody: true,
      logPrint: (val) => print(TAG),
    );
    _dio.interceptors.add(loginInterceptor);
    _tokenDio.interceptors.add(loginInterceptor);
  }

  Options getOptions(RequestOptions requestOptions, String? token) {
    return Options(
      method: requestOptions.method,
      sendTimeout: requestOptions.sendTimeout,
      receiveTimeout: requestOptions.receiveTimeout,
      extra: requestOptions.extra,
      headers: requestOptions.headers..addAll(_setToken(token)),
      responseType: requestOptions.responseType,
      contentType: requestOptions.contentType,
      validateStatus: requestOptions.validateStatus,
      receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
      followRedirects: requestOptions.followRedirects,
      maxRedirects: requestOptions.maxRedirects,
      requestEncoder: requestOptions.requestEncoder,
      responseDecoder: requestOptions.responseDecoder,
      listFormat: requestOptions.listFormat,
    );
  }

  T _handleError<T>(DioError error) {
    String errorDescription = "";
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
          //errorDescription = ErrorMessages.REQUEST_TO_SERVER_WAS_CANCELLED;
          break;
        case DioErrorType.connectTimeout:
          //errorDescription = ErrorMessages.CONNECTION_TIMEOUT_SERVER;
          break;
        case DioErrorType.other:
          //errorDescription = ErrorMessages.CONNECTIVITY_ISSUE_TRY_AGAIN;
          break;
        case DioErrorType.sendTimeout:
          // errorDescription = ErrorMessages.SEND_TIMEOUT_SERVER;
          break;
        case DioErrorType.receiveTimeout:
          //errorDescription = ErrorMessages.RECEIVE_TIMEOUT_SERVER;
          break;
        case DioErrorType.response:
          switch (error.response?.statusCode) {
            case 400:
              try {
                var r = json.encode(error.response?.data);
                return getEntity<T>({
                  "status": false,
                  "error": ['ValidationException'],
                });
              } catch (e) {
                //errorDescription = ErrorMessages.SOMETHING_WENT_WRONG;
              }
              break;

            case 403:
              try {
                var r = json.encode(error.response?.data);
                return getEntity<T>({
                  "status": false,
                  "error": ['errorDescription'],
                });
              } catch (e) {
                //errorDescription = ErrorMessages.SOMETHING_WENT_WRONG;
              }
              break;
            default:
              /* errorDescription =
                  '${ErrorMessages.SOMETHING_WENT_WRONG}\nstatus code: ${error.response?.statusCode}'; */
              break;
          }
          break;
      }
    } else {
      //errorDescription = ErrorMessages.UNEXPECTED_ERROR_OCCURRED;
    }
    return getEntity<T>({
      "status": false,
      "error": [errorDescription],
    });
  }

  Map<String, dynamic> _setToken(token, [Map<String, dynamic>? headers]) {
    if (headers != null) {
      headers.putIfAbsent('authorization', () => getAuthToken(token));
      return headers;
    } else {
      return {'authorization': getAuthToken(token)};
    }
  }

  String getToken(token) {
    return (token ?? '').toString().replaceFirst('Bearer ', '');
  }

  String getAuthToken(token) {
    return 'Bearer $token';
  }

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool? isTokenNeeded,
  }) async {
    try {
      var response = await _dio.get(path,
          queryParameters: queryParameters,
          options: await _defaultOptions(options, isTokenNeeded!),
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);

      return _validateResponse(response);
    } on DioError catch (e) {
      return _handleError<T>(e);
    }
  }

  Future<T> post<T>(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      bool? isTokenNeeded}) async {
    try {
      var response = await _dio.post(path,
          data: data,
          queryParameters: queryParameters,
          options: await _defaultOptions(options, isTokenNeeded!),
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);

      return _validateResponse(response);
    } on DioError catch (e) {
      return _handleError<T>(e);
    }
  }

  Future<T> put<T>(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      bool? isTokenNeeded}) async {
    try {
      var response = await _dio.put(path,
          data: data,
          queryParameters: queryParameters,
          options: await _defaultOptions(options, isTokenNeeded!),
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);

      return _validateResponse(response);
    } on DioError catch (e) {
      return _handleError<T>(e);
    }
  }

  Future<T> delete<T>(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      bool? isTokenNeeded}) async {
    try {
      var response = await _dio.delete(path,
          data: data,
          queryParameters: queryParameters,
          options: await _defaultOptions(options, isTokenNeeded!),
          cancelToken: cancelToken);

      return _validateResponse(response);
    } on DioError catch (e) {
      return _handleError<T>(e);
    }
  }

  Future<Options> _defaultOptions(Options? options, bool isTokenNeeded) async {
    // TODO implement when login api provided

    //FIXME : HERE GETIING THE SAVED VALUE
    if (isTokenNeeded) {
      /* String? token = await SharedPreferenceConfig.getString('access_token'); */
      return Options(headers: {"authorization": "Bearer token"});
    } else {
      return Options();
    }
  }

  Future<T> _validateResponse<T>(Response<dynamic> response) async {
    try {
      return getEntity<T>(response.data);
    } on Exception catch (e) {
      Logger().e(e);
      return _handleError<T>(e as DioError);
    }
  }

  /// To get entity for json arrays you need to give the entity type as a String.
  ///
  /// ex: T.toString() == 'List<Product>?'
  T getEntity<T>(_json) {
    var res;
    if (_json is List) {
    } else {
      switch (T) {
      }
    }
    return res;
  }
}
