import 'package:eccommerce4/core/class/crud.dart';
import 'package:eccommerce4/core/constant/backlinks.dart';

class GetVerifyCode {
  Crud crud;
  GetVerifyCode(this.crud);
  gettVerifyCode(String email, String verifyCode) async {
    var response = await crud.postData(
      verifycodeNameLink,
      {
        "email": email,
        "verifycode": verifyCode,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  resendVerifyCode(String email) async {
    var response = await crud.postData(
      resendverifycodeNameLink,
      {
        "email": email,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
