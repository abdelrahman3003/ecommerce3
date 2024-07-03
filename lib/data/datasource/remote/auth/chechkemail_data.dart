import 'package:eccommerce4/core/class/crud.dart';
import 'package:eccommerce4/core/constant/backlinks.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  checkemail(String email) async {
    var response = await crud.postData(
      checkemailNameLink,
      {
        "email": email,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
