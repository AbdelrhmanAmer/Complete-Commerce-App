import '../../../core/class/crud.dart';
import '../../../app_links.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  Future<Map<String, dynamic>> getAllData(String userId) async {
    var response = await crud.postData(
      AppLinks.allFavoriteItems,
      {
        'user_id': userId,
      },
    );
    return response;
  }

  Future<Map<String, dynamic>> addFavoriteItem(
      String userId, String itemId) async {
    var response = await crud.postData(
      AppLinks.addFavoriteItem,
      {
        'user_id': userId,
        'item_id': itemId,
      },
    );
    return response;
  }

  Future<Map<String, dynamic>> removeFavoriteItem(
      String userId, String itemId) async {
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
