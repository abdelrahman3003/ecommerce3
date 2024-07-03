class OrderDetailsModel {
  num? sumitemdiscountprice;
  int? itemcount;
  num? itemdiscountprice;
  int? cartId;
  int? cartUserid;
  int? cartItemid;
  int? cartOrder;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  String? itemsDes;
  String? itemsDesAr;
  int? itemsCat;

  OrderDetailsModel(
      {this.sumitemdiscountprice,
      this.itemcount,
      this.itemdiscountprice,
      this.cartId,
      this.cartUserid,
      this.cartItemid,
      this.cartOrder,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsDes,
      this.itemsDesAr,
      this.itemsCat});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    sumitemdiscountprice = json['sumitemdiscountprice'];
    itemcount = json['itemcount'];
    itemdiscountprice = json['itemdiscountprice'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemid = json['cart_itemid'];
    cartOrder = json['cart_order'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsDes = json['items_des'];
    itemsDesAr = json['items_des_ar'];
    itemsCat = json['items_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sumitemdiscountprice'] = this.sumitemdiscountprice;
    data['itemcount'] = this.itemcount;
    data['itemdiscountprice'] = this.itemdiscountprice;
    data['cart_id'] = this.cartId;
    data['cart_userid'] = this.cartUserid;
    data['cart_itemid'] = this.cartItemid;
    data['cart_order'] = this.cartOrder;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_des'] = this.itemsDes;
    data['items_des_ar'] = this.itemsDesAr;
    data['items_cat'] = this.itemsCat;
    return data;
  }
}
