import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:platzi_trip_flutter/models/data_model.dart';

class DataServices{
  String _baseUrl ='http://flutter.bslmeiyu.com/api/';

  Future<List<dynamic>> getUsersDemo()async{
    var info = rootBundle.loadString("json/data.json");
    List<dynamic> list = json.decode(await info);
    print(list);
    return list.map((e) => e).toList();
  }

  Future<List<DataModel>> getUsers() async {
    var apiUrl ='/billinfo';

    http.Response response = await http.get(
        Uri.parse(_baseUrl+apiUrl)
    );

    try{
      if(response.statusCode==200){
        print(await json.decode(response.body));
        List<dynamic> list = await json.decode(response.body);
        return list.map((e) => new DataModel.fromJson(e)).toList();
      }else{
        print('It failed');
        return <DataModel>[];
      }
    }catch(e){
      print(e);
      print('Api req Failes');
      return <DataModel>[];
    }

  }
}