class OrderModel {
  int? ordersId;
  int? ordersUserid;
  int? ordersPrice;
  int? ordersPricedelivery;
  String? ordersCoupon;
  int? ordersAddress;
  String? ordersDatetime;
  int? ordersType;
  int? ordersPaymentmethod;
  int? ordersStatus;
  int? totalprice;
  int? addressId;
  int? addressUserid;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;
  String? addressName;

  OrderModel(
      {this.ordersId,
      this.ordersUserid,
      this.ordersPrice,
      this.ordersPricedelivery,
      this.ordersCoupon,
      this.ordersAddress,
      this.ordersDatetime,
      this.ordersType,
      this.ordersPaymentmethod,
      this.ordersStatus,
      this.totalprice,
      this.addressId,
      this.addressUserid,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong,
      this.addressName});

  OrderModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersPrice = json['orders_price'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersCoupon = json['orders_coupon'];
    ordersAddress = json['orders_address'];
    ordersDatetime = json['orders_datetime'];
    ordersType = json['orders_type'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    totalprice = json['totalprice'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'].toDouble();
    addressLong = json['address_long'].toDouble();
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_userid'] = this.ordersUserid;
    data['orders_price'] = this.ordersPrice;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_address'] = this.ordersAddress;
    data['orders_datetime'] = this.ordersDatetime;
    data['orders_type'] = this.ordersType;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_status'] = this.ordersStatus;
    data['totalprice'] = this.totalprice;
    data['address_id'] = this.addressId;
    data['address_userid'] = this.addressUserid;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    data['address_name'] = this.addressName;
    return data;
  }
}
