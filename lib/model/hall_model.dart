// @dart=2.9
class HallModel{
  String name;
  String address;
  String imgPath;

  HallModel({this.name, this.address, this.imgPath});

  HallModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    address = json['address'];
    imgPath = json['imgPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['imgPath'] = this.imgPath;
    return data;
  }

}