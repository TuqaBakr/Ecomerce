class SubCategoriesModel {
  int? id;
  String? name;
  String? image;
  int? catigoryId;
  Null? createdAt;
  Null? updatedAt;

  SubCategoriesModel(
      {this.id,
        this.name,
        this.image,
        this.catigoryId,
        this.createdAt,
        this.updatedAt});

  SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    catigoryId = json['catigory_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['catigory_id'] = this.catigoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}