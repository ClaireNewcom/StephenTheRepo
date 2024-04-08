import "package:http/http.dart" as http;
//import 'dart:convert';

//Some of this was learned from https://www.youtube.com/watch?v=jpLa3NjWqs0, some of the code was copied from here.
//Some of this was learned from https://www.youtube.com/watch?v=c9XyI8zM73k, some of the code was copied from here.

  const String baseURL = '//api.weather.gov/';

  class ACallW {
    var client = http.Client();
    String? userAgent;

    Future<dynamic> get(String api) async{
      var url = Uri.parse(baseURL + api);
      var _headers = {
        'Authorization': 'userAgent', //I think this is how this works
        'api_key': 'claire.newcom.cn@gmail.com',
      };
      var response = await client.get(url, headers:_headers);
      if (response.statusCode == 200){
        return response.body;
      }
      else {
        throw Exception("Can not get weather"); //catch exception in user interface
      }
    }

    Future<dynamic> post(String api) async{
      var url = Uri.parse(baseURL + api);
      var _headers = {
        'Authorization': 'userAgent', //I think this is how this works
        'api_key': 'claire.newcom.cn@gmail.com',
       // 'Content-Type': 'application/json',
      };

      var response = await client.post(url, headers: _headers);
      if (response.statusCode == 201) {
        return response.body;
      } else {
        //throw exception and catch it in UI
      }
    }

    Future<dynamic> put(String api) async{}

    Future<dynamic> delete(String api) async{}

  }