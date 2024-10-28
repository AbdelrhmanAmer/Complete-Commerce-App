import 'package:get/get.dart';

import '../../core/services/user_service.dart';
import '../../core/constant/app_routes.dart';
import '../../core/functions/handle_response_status.dart';
import '../../core/class/status_request.dart';
import '../../data/model/item/favorite_item.dart';
import '../../data/model/item/base_item.dart';
import '../../data/data_source/remote/favorite_data.dart';
import '../../data/model/user.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());
  StatusRequest statusRequest = StatusRequest.error;

  UserService userService = Get.find();

  User? get user => userService.user.value;

  List<Item> favoriteItems = [];

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    var response = await favoriteData.getAllData(user!.id!);
    statusRequest = handleResponseStatus(response);
    _populateFavoriteItems(response['favoriteItems']);
  }

  _populateFavoriteItems(List<dynamic> items) {
    favoriteItems.addAll(
        items.map((favoriteItem) => FavoriteItem.fromJson(favoriteItem)));
    update();
  }

  toggleFavorite(Item item) {
    bool isItemFavorite = favoriteItems.any((i) => i.itemId == item.itemId);
    if (isItemFavorite) {
      favoriteItems.removeWhere((i) => i.itemId == item.itemId);
      removeFavoriteItem(user!.id!, item.itemId!);
    } else {
      FavoriteItem? favoriteItem;
      if (item is FavoriteItem) {
        favoriteItem = item as FavoriteItem?;
      } else {
        favoriteItem = FavoriteItem.fromItem(item);
      }
      favoriteItems.add(favoriteItem!);
      addFavoriteItem(user!.id!, item.itemId!);
    }
    update();
  }

  goToItemsDetailsScreen(Item item) {
    Get.toNamed(Routes.itemDetails, arguments: {'item': item});
  }

  addFavoriteItem(String userId, String itemId) async {
    var response = await favoriteData.addFavoriteItem(userId, itemId);
    statusRequest = handleResponseStatus(response);
    update();
  }

  removeFavoriteItem(String userId, String itemId) async {
    var response = await favoriteData.removeFavoriteItem(userId, itemId);
    statusRequest = handleResponseStatus(response);
    update();
  }
}
