import 'package:flutter/material.dart';

import '../../data/model/item.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.item});
  
  final Item item;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
    ));
  }
}