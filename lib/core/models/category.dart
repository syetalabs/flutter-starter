class Category{
  String? id;
  String? name;
  String? image;

  Category({this.id,this.name,this.image});

   Category.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}