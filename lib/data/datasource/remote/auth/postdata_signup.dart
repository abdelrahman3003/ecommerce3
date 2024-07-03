import 'package:eccommerce4/core/class/crud.dart';
import 'package:eccommerce4/core/constant/backlinks.dart';

class PostDataSignup {
  Crud crud;
  PostDataSignup(this.crud);
  postDataSignup(
      String username, String email, String phone, String password) async {
    var response = await crud.postData(
      signupNameLink,
      {
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
