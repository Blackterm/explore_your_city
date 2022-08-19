import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../home/home_view.dart';

class SplashController extends Controller {
  @override
  void onInitState() {
    Future.delayed(Duration(seconds: 5)).then((value) =>
        Navigator.pushAndRemoveUntil(
            getContext(),
            CupertinoPageRoute(builder: (context) => HomeView()),
            (route) => false));
  }

  @override
  void initListeners() {
    // TODO: implement initListeners
  }
}
