import 'package:get/get.dart';
import 'package:platzi_trip_flutter/models/data_model.dart';
import 'package:platzi_trip_flutter/services/data_services.dart';

class DataController extends GetxController{
  RxList<DataModel> list = <DataModel>[].obs;
  final service = new DataServices();
  var _loading = false.obs;

  get loading => _loading.value;

  get newList => list.where((e) => e.status==0?false:true).map((e) => e).toList();


  @override
  void onInit(){
    _loadData();
    super.onInit();
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