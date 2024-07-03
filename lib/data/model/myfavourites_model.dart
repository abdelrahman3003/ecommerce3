class MyfavouritesModel {
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
  int? favouritesId;
  int? favouritesUsersid;
  int? favouritesItemsid;
  int? usersId;

  MyfavouritesModel(
      {this.itemsId,
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
      this.itemsCat,
      this.favouritesId,
      this.favouritesUsersid,
      this.favouritesItemsid,
      this.usersId});

  MyfavouritesModel.fromJson(Map<String, dynamic> json) {
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
    favouritesId = json['favourites_id'];
    favouritesUsersid = json['favourites_usersid'];
    favouritesItemsid = json['favourites_itemsid'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['favourites_id'] = this.favouritesId;
    data['favourites_usersid'] = this.favouritesUsersid;
    data['favourites_itemsid'] = this.favouritesItemsid;
    data['users_id'] = this.usersId;
    return data;
  }
}
