import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:no_internet_connection_widget/no_internet_widget.dart';
import 'package:no_internet_connection_widget/no_internet_controller.dart';

class CheckInternetConnection extends StatelessWidget {
  const CheckInternetConnection({super.key, required this.child,this.offline});
  final Widget child;
  final Widget? offline;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: noInternetController.internetStateChange(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!) {
            return child;
          } else {
            return offline ?? const NoInternetConnection();
          }
        },
      ),
    );
  }
}
