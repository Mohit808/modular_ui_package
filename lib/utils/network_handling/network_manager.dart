import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../app_const.dart';
import '../utils.dart';
import 'custom_exception.dart';


class NetworkManager{
  // final http.Client httpClient;
  NetworkManager();

  get(String endPoint) async {
    var header={
      "Authorization":"token $token",
      "accept":"application/json"
    };
    try{
      print(header);
      print(AppConstModule.baseUrl+endPoint);
      var res=await http.get(Uri.parse(AppConstModule.baseUrl+endPoint),headers: header);
      // print(res.body);
      return responseReturn(res);
    }catch(e){
      print(e);
    }

    // on SocketException{
    //   throw FetchDataException("No internet connected");
    // }
  }

  post(String endPoint,{data}) async {
    var header={
      "Authorization":"token $token",
      // "accept":"application/json",
      "Content-Type": "application/json"
    };
    print(header);
    print(AppConstModule.baseUrl+endPoint);
    print(data);
    var res=await http.post(Uri.parse(AppConstModule.baseUrl+endPoint),body: data,headers: header);
    try{
      print(res.body);
      return responseReturn(res);
    }on SocketException{
      throw FetchDataException("No internet connected");
    }
  }

  put(String endPoint,{data}) async {
    var header={
      "Authorization":"token $token",
      "accept":"application/json"
    };
    print(header);
    print(AppConstModule.baseUrl+endPoint);
    print(data);
    var res=await http.put(Uri.parse(AppConstModule.baseUrl+endPoint),body: data,headers: header);
    try{
      print(res.body);
      return responseReturn(res);
    }on SocketException{
      throw FetchDataException("No internet connected");
    }
  }

  delete(String endPoint,{data}) async {
    var header={
      "Authorization":"token $token",
      "accept":"application/json"
    };
    print(header);
    print(AppConstModule.baseUrl+endPoint);
    print(data);
    var res=await http.delete(Uri.parse(AppConstModule.baseUrl+endPoint),body: data,headers: header);
    try{
      print(res.body);
      return responseReturn(res);
    }on SocketException{
      throw FetchDataException("No internet connected");
    }
  }

  responseReturn(http.Response response){
    switch(response.statusCode){
      case 200 || 201:
        return jsonDecode(response.body.toString());
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

}