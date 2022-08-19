import 'package:explore_your_city/src/app/pages/app_bar/app_bar_view.dart';
import 'package:explore_your_city/src/app/pages/home/home_controller.dart';
import 'package:explore_your_city/src/domain/entities/user.dart' as ent;
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../widgets/default_drawer.dart';

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

  @override
  // TODO: implement view
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavigationDrawer(widget._user),
      key: globalKey,
      body: Column(
        children: [AppBarWiev(isBackButtonActive: false)],
      ),
    );
  }
}
