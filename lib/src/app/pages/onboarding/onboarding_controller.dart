import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends Controller {
  late PageController pageController = PageController();


  SharedPreferences? sharedPreferences;

  @override
  void onInitState() async {
    pageController = PageController(initialPage: 0);
     sharedPreferences = await SharedPreferences.getInstance();
    
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
