import '../../../../core/class/crud.dart';
import '../../../../app_links.dart';

class EditProfileData {
  Crud crud;

  EditProfileData(this.crud);

  editProfile({
    required String id,
    required String username,
    required String address,
    required String email,
    required String phone,
  }) async {
    var response = await crud.postData(AppLinks.editProfile, {
      'id': id,
      'email': email,
      'address': address,
      'phone': phone,
      'username': username,
    });
    return response;
  }
}
