import 'package:commplete_commerce_app/app_links.dart';

import '../../../../../core/class/crud.dart';

class CheckEmailData {
  Crud crud;

  CheckEmailData(this.crud);

  postData(String email) async {
    var response = await crud.postData(
      AppLinks.checkEmail,
      {'email': email},
    );
    return response;
  }
}
