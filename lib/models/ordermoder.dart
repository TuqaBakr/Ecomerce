class OrderModel {
  int? id;
  int? userId;
  String? address;
  int? typeOrder;
  int? orderPriceDelivery;
  int? orderPrice;
  String? orderCoupon;
  String? orderDate;
  int? orderPayment;
  String? createdAt;
  String? updatedAt;

  OrderModel(
      {this.id,
        this.userId,
        this.address,
        this.typeOrder,
        this.orderPriceDelivery,
        this.orderPrice,
        this.orderCoupon,
        this.orderDate,
        this.orderPayment,
        this.createdAt,
        this.updatedAt});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    address = json['address'];
    typeOrder = json['type_order'];
    orderPriceDelivery = json['order_price_delivery'];
    orderPrice = json['order_price'];
    orderCoupon = json['order_coupon'];
    orderDate = json['order_date'];
    orderPayment = json['order_payment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['address'] = this.address;
    data['type_order'] = this.typeOrder;
    data['order_price_delivery'] = this.orderPriceDelivery;
    data['order_price'] = this.orderPrice;
    data['order_coupon'] = this.orderCoupon;
    data['order_date'] = this.orderDate;
    data['order_payment'] = this.orderPayment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}