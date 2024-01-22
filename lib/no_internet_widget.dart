import 'dart:io';

import 'package:flutter/material.dart';
import 'package:no_internet_connection_widget/no_internet_controller.dart';

class NoInternetConnection extends StatefulWidget {
  const NoInternetConnection({super.key});

  @override
  State<NoInternetConnection> createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("${Directory.current.path.toString()}assets/images/no-wi-fi.png", width: 200),
              40.height,
              Text(
                "No internet connection!",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              10.height,
              Text(
                "Please check your network connection.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              40.height,
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    noInternetController.tryAgain();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.blueAccent),
                    child: Center(
                      child: Text(
                        "Try Again",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              40.height,
            ],
          ),
        ),
      ),
    );
  }
}

extension IntExtensions on int? {
  int validate({int value = 0}) {
    return this ?? value;
  }

  Widget get height => SizedBox(height: this?.toDouble());

  Widget get width => SizedBox(width: this?.toDouble());
}
