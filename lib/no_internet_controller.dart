import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rxdart/rxdart.dart';

final noInternetController = NoInternetController.instance;

class NoInternetController {
  NoInternetController._privateConstructor();

  final BehaviorSubject<bool> _internetState = BehaviorSubject.seeded(true);

  static final NoInternetController _instance = NoInternetController._privateConstructor();

  static NoInternetController get instance => _instance;
  // Listen First in InitState of main function
  listen() {
    tryAgain();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionUpdate(result: result);
    });
  }

  void tryAgain(){
    Connectivity().checkConnectivity().then(
          (ConnectivityResult result) {
        connectionUpdate(result: result);
      },
    );
  }

  void connectionUpdate({required ConnectivityResult result}) => updateInternet(status: !(result == ConnectivityResult.none || result == ConnectivityResult.bluetooth));

  void updateInternet({required bool status}) async => _internetState.value = status;

  Stream<bool> internetStateChange() => _internetState.stream;
}
