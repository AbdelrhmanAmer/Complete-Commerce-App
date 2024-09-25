
import '../../../core/class/crud.dart';
import '../../../app_links.dart';

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
