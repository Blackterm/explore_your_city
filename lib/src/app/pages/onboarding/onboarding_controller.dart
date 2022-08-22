import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class OnboardingController extends Controller {
  late PageController pageController = PageController();

  @override
  void onInitState() {
    pageController = PageController(initialPage: 0);
    super.onInitState();
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  void initListeners() {
    // TODO: implement initListeners
  }
}
