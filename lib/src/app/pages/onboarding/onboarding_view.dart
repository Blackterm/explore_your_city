import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:explore_your_city/src/app/constants/constants.dart';
import 'package:explore_your_city/src/app/pages/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../data/repositories/data_user_repository.dart';
import 'onboarding_controller.dart';

class OnboardingView extends View {
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _OnboardingViewState(
      OnboardingController(),
    );
  }
}

late bool isLastPage = false;

class _OnboardingViewState
    extends ViewState<OnboardingView, OnboardingController>
    with TickerProviderStateMixin {
  _OnboardingViewState(OnboardingController controller) : super(controller);

  @override
  // TODO: implement view
  Widget get view {
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: padding.top),
        child: ControlledWidgetBuilder<OnboardingController>(
            builder: (context, controller) {
          return PageView(
            onPageChanged: (value) {
              setState(() {
                isLastPage = value == 2;
              });
            },
            controller: controller.pageController,
            children: [
              _OnBoardingContainer(
                controller: controller,
                assetImage: 'assets/images/1.png',
              ),
              _OnBoardingContainer(
                controller: controller,
                assetImage: 'assets/images/2.png',
              ),
              _OnBoardingContainer(
                controller: controller,
                assetImage: 'assets/images/3.png',
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _OnBoardingContainer extends StatelessWidget {
  const _OnBoardingContainer({
    required this.controller,
    required this.assetImage,
  });

  final OnboardingController controller;
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Container(
      color: Colors.amber,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            assetImage,
            color: Colors.white,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: size.height / 2,
            right: padding.right + 20,
            child: Text(
              "Deneme1",
              style: kLargeTitleStyle(cBlue),
            ),
          ),
          Positioned(
            right: padding.right + 20,
            bottom: padding.bottom + 20,
            child: InkWell(
              onTap: () {
                !isLastPage
                    ? controller.pageController.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInToLinear)
                    : Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                HomeView(DataUserRepository().user)),
                      );
              },
              child: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
