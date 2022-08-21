import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeController extends Controller {
  final sliderController = CarouselController();
  int activeIndex = 0;
  @override
  void initListeners() {
    // TODO: implement initListeners
  }
}
