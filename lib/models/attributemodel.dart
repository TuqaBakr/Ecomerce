class AttributeModel {
  int? price;
  String? size;
  int? quaintity;
  String? color;

  AttributeModel({this.price, this.size, this.quaintity, this.color});

  AttributeModel.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    size = json['size'];
    quaintity = json['quaintity'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['size'] = this.size;
    data['quaintity'] = this.quaintity;
    data['color'] = this.color;
    return data;
  }
}