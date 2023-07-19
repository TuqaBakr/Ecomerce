class ItemsModel {
  int? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  int? subcatigoryId;
  String? image;
  int? rating;
  String? createdAt;
  String? updatedAt;

  ItemsModel(
      {this.id,
        this.name,
        this.nameAr,
        this.description,
        this.descriptionAr,
        this.subcatigoryId,
        this.image,
        this.rating,
        this.createdAt,
        this.updatedAt});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    subcatigoryId = json['subcatigory_id'];
    image = json['image'];
    rating = json['rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['description'] = this.description;
    data['description_ar'] = this.descriptionAr;
    data['subcatigory_id'] = this.subcatigoryId;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}