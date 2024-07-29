import '../class/status_request.dart';

StatusRequest handleData(response) {
  if (response == null) {
    return StatusRequest.failure;
  } else if (response is Map<String, dynamic> && response['status'] == 'success') {
    return StatusRequest.success;
  } else {
    return StatusRequest.failure;
  }
}
