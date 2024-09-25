
import '../../../core/class/crud.dart';
import '../../../app_links.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  addFavoriteItem(int userId, int itemId) async {
    var response = await crud.postData(
      AppLinks.addFavoriteItem,
      {
        'user_id': userId,
        'item_id': itemId,
      },
    );
    return response;
  }
  removeFavoriteItem(int userId, int itemId) async {
    var response = await crud.postData(
      AppLinks.removeFavoriteItem,
      {
        'user_id': userId,
        'item_id': itemId,
      },
    );
    return response;
  }
}
