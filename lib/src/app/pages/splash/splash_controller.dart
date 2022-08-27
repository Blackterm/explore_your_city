import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:explore_your_city/src/app/pages/onboarding/onboarding_view.dart';
import 'package:explore_your_city/src/data/repositories/data_user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../historic_sites/historic_sites_view.dart';
import '../home/home_view.dart';

class SplashController extends Controller {
  SharedPreferences? sharedPreferences;

  bool? firstLogin;

  @override
  void onInitState() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.getBool("firstLogin") != null
        ? firstLogin = await sharedPreferences!.getBool("firstLogin")!
        : null;
    firstLogin != null
        ? Future.delayed(Duration(seconds: 5)).then((value) =>
            Navigator.pushAndRemoveUntil(
                getContext(),
                CupertinoPageRoute(
                    builder: (context) => HomeView(DataUserRepository().user)),
                (route) => false))
        : Future.delayed(Duration(seconds: 5)).then((value) =>
            Navigator.pushAndRemoveUntil(
                getContext(),
                CupertinoPageRoute(builder: (context) => OnboardingView()),
                (route) => false));
    ;
  }

  @override
  void initListeners() {}
}
