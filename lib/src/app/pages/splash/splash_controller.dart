import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:explore_your_city/src/app/pages/onboarding/onboarding_view.dart';
import 'package:explore_your_city/src/data/repositories/data_user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../home/home_view.dart';

class SplashController extends Controller {
  @override
  void onInitState() {
    Future.delayed(Duration(seconds: 5)).then((value) =>
        Navigator.pushAndRemoveUntil(
            getContext(),
            CupertinoPageRoute(builder: (context) => OnboardingView()),
            (route) => false));
  }

  void waitResponse = () {};

  @override
  void initListeners() {}
}
