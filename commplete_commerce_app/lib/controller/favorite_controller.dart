import 'package:get/get.dart';

import 'home_controller.dart';
import '../core/functions/show_custom_snack_bar.dart';
import '../core/constant/app_routes.dart';
import '../core/functions/handle_response_status.dart';
import '../core/class/status_request.dart';
import '../data/model/item/favorite_item.dart';
import '../data/model/item/item.dart';
import '../data/model/item/base_item.dart';
import '../data/data_source/remote/favorite_data.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());
  StatusRequest statusRequest = StatusRequest.error;

  final String? userId = HomeController.user.id;
  List<BaseItem> favoriteItems = [];

  @override
  void onInit() {
    super.onInit();

    getData();
  }

  getData() async {
    if(userId != null){
    var response = await favoriteData.getAllData(userId!);
      statusRequest = handleResponseStatus(response);
      _populateFavoriteItems(response['favoriteItems']);
    }else{
      showCustomSnackBar(title: 'Home Controller: User id is null');
    }
  }

  _populateFavoriteItems(List<dynamic> items) {
    favoriteItems.addAll(
        items.map((favoriteItem) => FavoriteItem.fromJson(favoriteItem)));
    update();
  }

  toggleFavorite(BaseItem item) {
    bool isItemFavorite = favoriteItems.any((i) => i.itemId == item.itemId);
    if (isItemFavorite) {
      favoriteItems.removeWhere((i) => i.itemId == item.itemId);
      removeFavoriteItem(userId!, item.itemId!);
    } else {
      FavoriteItem? favoriteItem;
      if (item is Item) {
        favoriteItem = FavoriteItem.fromItem(item);
      } else {
        favoriteItem = item as FavoriteItem?;
      }
      favoriteItems.add(favoriteItem!);
      addFavoriteItem(userId!, item.itemId!);
    }
    update();
  }

  goToItemsDetailsScreen(BaseItem item) {
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
