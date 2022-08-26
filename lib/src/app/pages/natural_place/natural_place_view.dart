import 'package:explore_your_city/src/app/constants/constants.dart';
import 'package:explore_your_city/src/app/pages/app_bar/app_bar_view.dart';
import 'package:explore_your_city/src/app/pages/natural_place/natural_place_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../widgets/default_detail_container.dart';

class NaturalPlaceView extends View {
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _NaturalPlaceViewState(
      NaturalPlaceController(),
    );
  }
}

class _NaturalPlaceViewState
    extends ViewState<NaturalPlaceView, NaturalPlaceController> {
  _NaturalPlaceViewState(NaturalPlaceController controller) : super(controller);

  @override
  // TODO: implement view
  Widget get view {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Scaffold(
      body: Column(
        children: [
          AppBarWiev(isBackButtonActive: true),
          DefaultDetailContainer(
            imageUrl: "https://www.kayserinethaber.com/d/r/333.jpg",
            placeName: "Kapuzbaşı Şelaleleri",
            numberOfComments: "35",
            numberOfVisitors: "15",
          ),
        ],
      ),
    );
  }
}
