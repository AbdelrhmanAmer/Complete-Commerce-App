import 'dart:developer';

import 'package:flutter/material.dart';

import '../core/functions/handle_response_status.dart';

import '../core/functions/show_custom_snack_bar.dart';
import '../core/class/status_request.dart';
import '../data/data_source/remote/favorite_data.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  Map<int, bool> isFavorite = {};
  FavoriteData favoriteData = FavoriteData(Get.find());
  StatusRequest statusRequest = StatusRequest.error;

  toggleFavorite(int key) {
    isFavorite[key] = !isFavorite[key]!;
    log(isFavorite.toString());
    update();
  }

  addFavoriteItem(int userId, int itemId) async {
    var response = await favoriteData.addFavoriteItem(userId, itemId);
    statusRequest = handleResponseStatus(response);
    if (statusRequest == StatusRequest.success) {
      showCustomSnackBar(
          title: response['message'], backColor: Colors.green.withOpacity(.5));
    }
  }

  removeFavoriteItem(int userId, int itemId) async {
    var response = await favoriteData.removeFavoriteItem(userId, itemId);
    statusRequest = handleResponseStatus(response);
  }
}
