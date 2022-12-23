
class Food {
  String? id;
  String? name;
  String? image;
  String? categoryId;
  String? categotyName;
  int? price;
  List<UnitType>? unitType;
  String? description;

  Food({this.id, this.name, this.image, this.categoryId, this.categotyName, this.price, this.unitType, this.description});

  Food.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["category_id"] is String) {
      categoryId = json["category_id"];
    }
    if(json["categoty_name"] is String) {
      categotyName = json["categoty_name"];
    }
    if(json["price"] is int) {
      price = json["price"];
    }
    if(json["unit_type"] is List) {
      unitType = json["unit_type"] == null ? null : (json["unit_type"] as List).map((e) => UnitType.fromJson(e)).toList();
    }
    if(json["description"] is String) {
      description = json["description"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["category_id"] = categoryId;
    _data["categoty_name"] = categotyName;
    _data["price"] = price;
    if(unitType != null) {
      _data["unit_type"] = unitType?.map((e) => e.toJson()).toList();
    }
    _data["description"] = description;
    return _data;
  }
}

class UnitType {
  String? name;
  String? value;
  int? price;

  UnitType({this.name, this.value, this.price});

  UnitType.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["value"] is String) {
      value = json["value"];
    }
    if(json["price"] is int) {
      price = json["price"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["value"] = value;
    _data["price"] = price;
    return _data;
  }
}