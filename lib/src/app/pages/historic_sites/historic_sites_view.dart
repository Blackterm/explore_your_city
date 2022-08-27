import 'package:explore_your_city/src/app/pages/historic_sites/historic_sites_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../historic_sites_detail/historic_sites_detail_view.dart';
import '../../widgets/default_detail_container.dart';
import '../app_bar/app_bar_view.dart';

class HistoricSitesView extends View {
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _HistoricSitesViewState(
      HistoricSitesController(),
    );
  }
}

class _HistoricSitesViewState
    extends ViewState<HistoricSitesView, HistoricSitesController> {
  _HistoricSitesViewState(HistoricSitesController controller)
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
          DefaultDetailContainer(
            imageUrl:
                "https://cdn.otelleri.net/landing/kayseri/gezi-rehberi/kayseri-kalesi-3114-f7.jpg",
            placeName: "Kayseri Kalesi",
            numberOfComments: "50",
            numberOfVisitors: "350",
            pageName: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => HistoricSitesDetailView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
