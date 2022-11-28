import 'package:get/get.dart';
import 'package:platzi_trip_flutter/models/data_model.dart';
import 'package:platzi_trip_flutter/pages/my_home_page.dart';
import 'package:platzi_trip_flutter/services/data_services.dart';

class DataController extends GetxController{
  var listDemo = [].obs;
  RxList<DataModel> list = <DataModel>[].obs;
  final service = new DataServices();
  var _loading = false.obs;
  bool _isDemo = true;

  get loading => _loading.value;
  get isDemo => _isDemo;

  get newList => _isDemo
      ?listDemo.where((e) => e["status"]).map((e) => e).toList()
      :list.where((e) => e.status==0?false:true).map((e) => e).toList();


  @override
  void onInit(){
    _isDemo
    ?_loadDataDemo()
    :_loadData();
    super.onInit();
  }

  _loadDataDemo() async {
    _loading.value=false;
    try{
      var info = service.getUsersDemo();
      listDemo.addAll(await info);
    }catch(e){
      print("Encountered error $e!");
    }finally{
      _loading.value=true;
    }


  }

  _loadData() async {
    _loading.value=false;
    try{
      var info = service.getUsers();
      list.addAll(await info);
    }catch(e){
      print("Encountered error $e!");
    }finally{
      _loading.value=true;
    }
  }

}