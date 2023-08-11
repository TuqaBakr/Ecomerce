class AttributeModel {
  int? quaintity;
  String? color;

  AttributeModel({this.quaintity, this.color});

  AttributeModel.fromJson(Map<String, dynamic> json) {
    quaintity = json['quaintity'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quaintity'] = this.quaintity;
    data['color'] = this.color;
    return data;
  }
}