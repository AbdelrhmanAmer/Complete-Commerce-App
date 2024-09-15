
import '../../../core/class/crud.dart';
import '../../../app_links.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  postData() async {
    var response = await crud.postData(AppLinks.items, {});

    return response;
  }
}
