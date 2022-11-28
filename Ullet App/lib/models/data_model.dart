class DataModel{
  String brand_id;
  String brand_name;
  String brand_logo;
  int status;
  String due_info;
  String due;

  DataModel({
    required this.brand_id,
    required this.brand_logo,
    required this.brand_name,
    required this.due,
    required this.due_info,
    required this.status});
  factory DataModel.fromJson(Map<String,dynamic> json) => DataModel(
      brand_id: json["brand_id"].toString(),
      brand_name: json["brand_name"],
      brand_logo: json["brand_logo"]==null?"images/brand.png":json["brand_logo"],
      status: json["status"],
      due: json["due"].toString(),
      due_info: json["due_info"]
  );
}