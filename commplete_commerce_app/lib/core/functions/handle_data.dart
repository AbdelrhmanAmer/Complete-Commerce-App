import '../class/status_request.dart';

StatusRequest handleData(response) {
  if (response is Map<String, dynamic>) {
    return StatusRequest.success;
  } else {
    return response;
  }
}
