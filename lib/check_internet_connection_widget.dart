import 'package:flutter/material.dart';
import 'package:no_internet_connection_widget/no_internet_controller.dart';
import 'package:no_internet_connection_widget/no_internet_widget.dart';

class CheckInternetConnection extends StatelessWidget {
  const CheckInternetConnection({super.key, required this.child, this.whenOffline});

  final Widget child;
  final Widget? whenOffline;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: noInternetController.internetStateChange(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!) {
            return child;
          } else {
            return whenOffline ?? const NoInternetConnection();
          }
        },
      ),
    );
  }
}
