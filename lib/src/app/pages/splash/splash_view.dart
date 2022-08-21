import 'package:explore_your_city/src/app/constants/constants.dart';
import 'package:explore_your_city/src/app/pages/splash/splash_controller.dart';
import 'package:explore_your_city/src/app/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lottie/lottie.dart';

class SplashView extends View {
  @override
  State<StatefulWidget> createState() {
    return _SplashViewState(SplashController());
  }
}

class _SplashViewState extends ViewState<SplashView, SplashController> {
  _SplashViewState(SplashController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: globalKey,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: size.height - 100,
                      child: Center(
                        child: Lottie.asset(aLoading),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      EYCTexts.exploreYourCity,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
