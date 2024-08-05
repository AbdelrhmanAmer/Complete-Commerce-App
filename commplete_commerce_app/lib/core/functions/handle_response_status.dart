import 'show_custom_dialog.dart';
import '../class/status_request.dart';

StatusRequest handleResponseStatus(response) {
  if (response['status'] == 'Success') {
    return StatusRequest.success;
  } else {
    showCustomDialog(title: response['status'], message: response['message']);
    if (response['status'] == 'Exists') {
      return StatusRequest.exists;
    } else if (response['status'] == 'Failure') {
      return StatusRequest.failure;
    } else {
      return StatusRequest.error;
    }
  }
}
