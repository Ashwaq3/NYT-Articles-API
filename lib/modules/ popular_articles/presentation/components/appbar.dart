import 'package:flutter/material.dart';

AppBar buildAppbar(BuildContext context, String title,
    {Widget? action}) {
  return
    AppBar(
        elevation: 5.0,
         backgroundColor: const Color(0xFF78E1C3),
        centerTitle: true,
        title:  Text(
            title,
            textAlign: TextAlign.center,
        ),
        actions: [
          if(action != null)
            action
        ]
    );
}