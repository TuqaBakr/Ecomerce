class CategoriesModel {
  int? _id;
  String? _name;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
/*
  CategoriesModel(
      {
        int? id,
        String? name,
        String? image,
        String? createdAt,
        String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (image != null) {
      _image = image;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get image => _image;
  set image(String? image) => _image = image;
  Null? get createdAt => _createdAt;
  set createdAt(Null? createdAt) => _createdAt = createdAt;
  Null? get updatedAt => _updatedAt;
  set updatedAt(Null? updatedAt) => _updatedAt = updatedAt;
*/

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['image'] = _image;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}