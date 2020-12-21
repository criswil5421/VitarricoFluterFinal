
part of 'api_materiaprima.dart';

class _MateriaprimaApi implements MateriaprimaApi{
  _MateriaprimaApi(this._dio,{this.baseUrl}){
    ArgumentError.checkNotNull(_dio, "_dio");
    this.baseUrl ??="http://ec2-3-236-149-242.compute-1.amazonaws.com:8080/CalidadServApi-0.0.1-SNAPSHOT/materiaprima";
  }

  final Dio _dio;
  String baseUrl;

  @override
  getMateriaprima() async{

    print("hola");
    const _extra=<String, dynamic>{};
    final _queryParameters=<String, dynamic>{};
    final _data=<String, dynamic>{};
    final Response<List<dynamic>> _result= await _dio.request('/lista',
        queryParameters:_queryParameters,
        options:RequestOptions(
            method: 'GET',
            headers:<String, dynamic>{},
            extra:_extra,
            baseUrl:baseUrl
        ),
        data:_data);
    var value = _result.data
        .map((dynamic i)=>ModeloMateriaPrima.fromJson(i as Map<String, dynamic>)).toList();

    print("value $value");
    return Future.value(value);
  }

  @override
  getMateriaprima2(token) async{

    final prefs = await SharedPreferences.getInstance();
    var tokenx=prefs.getString("token");
    print("Token es: $tokenx");

    ArgumentError.checkNotNull(token, "token");

    const _extra=<String, dynamic>{};
    final _queryParameters=<String, dynamic>{};
    final _data=<String, dynamic>{};
    final Response<List<dynamic>> _result= await _dio.request('/lista2',
        queryParameters:_queryParameters,
        options:RequestOptions(
            method: 'GET',
            headers:<String, dynamic>{"Authorization":token},
            extra:_extra,
            baseUrl:baseUrl
        ),
        data:_data);
    var value = _result.data
        .map((dynamic i)=>ModeloMateriaPrima.fromJson(i as Map<String, dynamic>)).toList();

    return Future.value(value);
  }

  @override
  getMateriaNombre(materiaNombre) async{
    ArgumentError.checkNotNull(materiaNombre, 'nombre');
    final prefs= await SharedPreferences.getInstance();
    var tokenx=prefs.getString("token");
    print("VER: ${tokenx}");
    ArgumentError.checkNotNull(tokenx, "token");
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        '/detailname/$materiaNombre',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{"Authorization":tokenx},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i)=>ModeloMateriaPrima.fromJson(i as Map<String, dynamic>)).toList();
    return Future.value(value);
  }


  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}