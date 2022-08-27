import 'package:explore_your_city/src/app/pages/traditional_dishes/traditional_dishes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../widgets/default_detail_container.dart';
import '../app_bar/app_bar_view.dart';

class TraditionalDishesView extends View {
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _TraditionalDishesViewState(
      TraditionalDishesController(),
    );
  }
}

class _TraditionalDishesViewState
    extends ViewState<TraditionalDishesView, TraditionalDishesController> {
  _TraditionalDishesViewState(TraditionalDishesController controller)
      : super(controller);

  @override
  // TODO: implement view
  Widget get view {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Scaffold(
      body: Column(
        children: [
          AppBarWiev(isBackButtonActive: true),
          SizedBox(
            height: 20,
          ),
          DefaultDetailContainer(
            imageUrl:
                "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg",
            placeName: "Mantı",
            numberOfComments: "35",
            numberOfVisitors: "15",
            pageName: (){},
          ),
        ],
      ),
    );
  }
}
