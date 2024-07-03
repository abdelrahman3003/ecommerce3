import 'package:eccommerce4/core/class/crud.dart';
import 'package:eccommerce4/core/constant/backlinks.dart';

class ResetpasswordData {
  Crud crud;
  ResetpasswordData(this.crud);
  resetpassword(String email, String newPassword, String retypePassword) async {
    var response = await crud.postData(
      resetpasswordNameLink,
      {
        "email": email,
        "New_password": newPassword,
        "Retype_password": retypePassword,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
