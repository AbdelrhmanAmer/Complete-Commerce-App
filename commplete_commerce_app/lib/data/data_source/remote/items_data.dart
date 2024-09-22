import '../../../core/class/crud.dart';
import '../../../app_links.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  postData(String userId) async {
    var response = await crud.postData(AppLinks.items, {
      'user_id': userId,
    });

    return response;
  }
}
