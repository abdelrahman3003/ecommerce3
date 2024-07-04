import 'package:eccommerce4/core/class/crud.dart';
import 'package:eccommerce4/core/constant/backlinks.dart';
import 'package:eccommerce4/core/services/services.dart';
import 'package:eccommerce4/data/model/address/address_model.dart';
import 'package:get/get.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  AppServices appServices = Get.find();
  addAddress(Address address) async {
    Map data = {
      'userid': appServices.sharedPreferences.getString('id'),
      'addressname': address.addressName,
      'city': address.addressCity,
      'street': address.addressStreet,
      'lat': address.addressLat.toString(),
      'long': address.addressLong.toString(),
    };
    var response = await crud.postData(addAdressNameLismk, data);
    return response.fold((l) => l, (r) => r);
  }
}
