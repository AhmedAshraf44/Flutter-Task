import 'package:flutter/material.dart';


PreferredSizeWidget buildAppBar({required String title}) {
  return AppBar(
    elevation: 0,
    shadowColor: Colors.transparent,
    centerTitle: true,
    title:  Text(
      title ,
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.search,),
        onPressed: () {
        },
      ),
    ],
  );
}