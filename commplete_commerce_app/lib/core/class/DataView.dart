import 'package:flutter/material.dart';

import 'status_request.dart';

class DataView extends StatelessWidget {
  const DataView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  final StatusRequest statusRequest;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(child: Text('Loading'))
        : statusRequest == StatusRequest.internetFailure
            ? const Center(child: Text('Offline Failure'))
            : statusRequest == StatusRequest.serverFailure
                ? const Center(child: Text('Server Failure'))
                : statusRequest == StatusRequest.noData
                    ? const Center(child: Text('Failure: No Data'))
                    : widget;
  }
}
