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
        ? const Center(child: Text('Loading', style: TextStyle(fontSize: 30)))
        : statusRequest == StatusRequest.internetFailure
            ? const Center(
                child: Text('Internet Failure', style: TextStyle(fontSize: 30)))
            : statusRequest == StatusRequest.serverException
                ? const Center(
                    child: Center(
                        child: Text('Server Failure', style: TextStyle(fontSize: 30))))
                : statusRequest == StatusRequest.noData
                    ? const Center(
                        child: Center(
                            child: Text('No Data!',
                                style: TextStyle(fontSize: 30))))
                    : widget;
  }
}
