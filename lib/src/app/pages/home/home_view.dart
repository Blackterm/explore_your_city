import 'package:carousel_slider/carousel_slider.dart';
import 'package:explore_your_city/src/app/constants/constants.dart';
import 'package:explore_your_city/src/app/pages/app_bar/app_bar_view.dart';
import 'package:explore_your_city/src/app/pages/historic_sites/historic_sites_view.dart';
import 'package:explore_your_city/src/app/pages/home/home_controller.dart';
import 'package:explore_your_city/src/app/pages/natural_place/natural_place_view.dart';
import 'package:explore_your_city/src/app/pages/splash/splash_view.dart';
import 'package:explore_your_city/src/domain/entities/user.dart' as ent;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../widgets/default_drawer.dart';
import '../traditional_dishes/traditional_dishes_view.dart';

class HomeView extends View {
  ent.User _user;
  HomeView(this._user);
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState(HomeController());
  }
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  _HomeViewState(HomeController controller) : super(controller);
// WavyAnimatedText(text)
  @override
  // TODO: implement view
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavigationDrawer(widget._user),
      key: globalKey,
      body: Column(
        children: [
          AppBarWiev(isBackButtonActive: false),
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              child: Column(
                children: [
                  ControlledWidgetBuilder<HomeController>(
                      builder: (context, controller) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: CarouselSlider.builder(
                        carouselController: controller.sliderController,
                        options: CarouselOptions(
                          height: size.height * 0.28,
                          initialPage: 0,
                          viewportFraction: 1,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          autoPlayInterval: Duration(
                            seconds: 6,
                          ),
                          autoPlayCurve: Curves.easeInToLinear,
                          onPageChanged: (index, reason) => setState(
                            () => controller.activeIndex = index,
                          ),
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index, realIndex) {
                          final urlImage =
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";

                          return buildImage(urlImage);
                        },
                      ),
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    spacing: 80,
                    runSpacing: 20,
                    children: [
                      _DefaultCityInfoContainer("Yemekler", () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => TraditionalDishesView(),
                          ),
                        );
                      }),
                      _DefaultCityInfoContainer("Doğal Yerler", () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => NaturalPlaceView(),
                          ),
                        );
                      }),
                      _DefaultCityInfoContainer("Tarihi Yerler", () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => HistoricSitesView(),
                          ),
                        );
                      }),
                      _DefaultCityInfoContainer("Tarihi", () {}),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildImage(String urlImage) => InkWell(
        child: Container(
          color: cGrey,
          width: double.infinity,
          child: FadeInImage(
            repeat: ImageRepeat.noRepeat,
            image: AssetImage("assets/images/placeholder.png"),
            fit: BoxFit.fill,
            placeholder: AssetImage("assets/images/placeholder.png"),
          ),
        ),
        onTap: () {},
      );
}

class _DefaultCityInfoContainer extends StatelessWidget {
  final Function() onTap;
  String content;
  _DefaultCityInfoContainer(this.content, this.onTap);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: cBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 75,
        width: 150,
        child: Center(
            child: Text(
          content,
          style: kLargeTitleStyle(cWhite),
        )),
      ),
      onTap: onTap,
    );
  }
}
