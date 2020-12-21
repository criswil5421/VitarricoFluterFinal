
part of 'api_salida_produccion.dart';

class _SalidaProduccionApi implements SalidaProduccionApi{
  _SalidaProduccionApi(this._dio, {this.baseUrl}){
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??="http://192.168.2.234:8080";
  }

  final Dio _dio;
  String baseUrl;

  @override
  getSalidaProduccion() async{
    final prefs= await SharedPreferences.getInstance();
    var tokenx=prefs.getString("token");
    print("VER: ${tokenx}");
    ArgumentError.checkNotNull(tokenx, "token");
    const _extra=<String, dynamic>{};
    final queryParameters= <String, dynamic>{};
    final _data=<String, dynamic>{};
    final Response<List<dynamic>> _result= await _dio.request('/salidaproduccion/lista2',
        queryParameters:queryParameters,
        options:RequestOptions(
            method:'GET',
            headers:<String, dynamic>{"Authorization":tokenx},
            extra:_extra,
            baseUrl:baseUrl
        ),
        data:_data);
    var value=_result.data
        .map((dynamic i)=>ModeloSalidaProduccion.fromJson(i as Map<String, dynamic>)).toList();


    return Future.value(value);
  }

  @override
  getSalidaProduccion2(token) async{
    final prefs= await SharedPreferences.getInstance();
    var tokenx=prefs.getString("token");
    print("TOKEN es: $tokenx");
    ArgumentError.checkNotNull(token, "token");
    const _extra=<String, dynamic>{};
    final queryParameters= <String, dynamic>{};
    final _data=<String, dynamic>{};
    final Response<List<dynamic>> _result= await _dio.request('/salidaproduccion/lista2',
        queryParameters:queryParameters,
        options:RequestOptions(
            method:'GET',
            headers:<String, dynamic>{"Authorization":token},
            extra:_extra,
            baseUrl:baseUrl
        ),
        data:_data);
    var value=_result.data
        .map((dynamic i)=>ModeloSalidaProduccion.fromJson(i as Map<String, dynamic>)).toList();


    return Future.value(value);
  }

  @override
  login(user) async{
    ArgumentError.checkNotNull(user, "user");
    const _extra=<String, dynamic>{};
    final queryParameters= <String, dynamic>{};
    final _data=<String, dynamic>{};
    _data.addAll(user.toJson()?? <String, dynamic>{});
    final Response<Map<String,dynamic>> _result= await _dio.request('/auth/login',
        queryParameters:queryParameters,
        options:RequestOptions(
            method:'POST',
            headers:<String, dynamic>{},
            extra:_extra,
            baseUrl:baseUrl
        ),
        data:_data);
    var value=ModeloUsuario.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getSalidaProduccionId(id) async{
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/salidaproduccion/detail/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ModeloSalidaProduccion.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  deleteSalidaProduccion(id) async{
    ArgumentError.checkNotNull(id, '0');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/salidaproduccion/delete/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ModeloMensaje.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  updateSalidaProduccion(id, salidaproduccion) async{
    ArgumentError.checkNotNull(id, '0');
    ArgumentError.checkNotNull(salidaproduccion, 'salidaproduccion');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(salidaproduccion.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/salidaproduccion/update/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ModeloMensaje.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  createSalidaProduccion(salidaproduccion) async{
    ArgumentError.checkNotNull(salidaproduccion, 'salidaproduccion');
    final prefs= await SharedPreferences.getInstance();
    var tokenx=prefs.getString("token");
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(salidaproduccion.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/salidaproduccion/create',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{"Authorization":tokenx},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ModeloMensaje.fromJson(_result.data);
    return Future.value(value);
  }

}
