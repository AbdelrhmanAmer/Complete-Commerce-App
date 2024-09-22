import 'package:commplete_commerce_app/app_links.dart';

import '../../../core/class/crud.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getData(String userId) async {
    var response = await crud.postData(AppLinks.home, {
      'user_id': userId,
    });

    return response;
  }
}
