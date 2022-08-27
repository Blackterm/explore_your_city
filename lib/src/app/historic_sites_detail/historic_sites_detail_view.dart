import 'package:explore_your_city/src/app/pages/historic_sites/historic_sites_controller.dart';
import 'package:explore_your_city/src/domain/entities/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:maps_launcher/maps_launcher.dart';
import '../constants/constants.dart';
import '../pages/app_bar/app_bar_view.dart';

class HistoricSitesDetailView extends View {
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _HistoricSitesDetailViewState(
      HistoricSitesController(),
    );
  }
}

class _HistoricSitesDetailViewState
    extends ViewState<HistoricSitesDetailView, HistoricSitesController> {
  _HistoricSitesDetailViewState(HistoricSitesController controller)
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
          Column(
            children: [
              Container(
                width: size.width - 20,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        "https://cdn.otelleri.net/landing/kayseri/gezi-rehberi/kayseri-kalesi-3114-f7.jpg",
                      )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Text(
                      "Kayseri Kalesi",
                      style: kLargeTitleStyle(cBlue),
                    ),
                    Spacer(),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: cWhite,
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: IconButton(
                          iconSize: 20,
                          onPressed: () {
                            MapsLauncher.launchCoordinates(
                              38.72121489492425,
                              35.48854201774676,
                              "Kayseri Kalesi",
                            );
                          },
                          icon: Icon(
                            Icons.location_on,
                            color: cBlue,
                          )),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.accessibility_new_rounded,
                          size: size.height * 0.045,
                          color: cBlue,
                        ),
                        Text(
                          "35",
                          style: TextStyle(color: cBlue),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          size: size.height * 0.045,
                          color: cBlue,
                        ),
                        Text(
                          _userComment.length.toString(),
                          style: TextStyle(color: cBlue),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.43,
                child: ListView.builder(
                    itemCount: _userComment.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: cWhite,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  _userComment[index].userImage,
                                )),
                          ),
                        ),
                        title: Text(_userComment[index].userName),
                        subtitle: Text(_userComment[index].comment),
                      );
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}

List<Comment> _userComment = [
  Comment("1", "M.ERAVSAR", "https://randomuser.me/api/portraits/men/57.jpg",
      "Çok etkileyici bir yerdi", "27.08.2022"),
  Comment(
      "45456456",
      "M.OZDEN",
      "https://randomuser.me/api/portraits/men/57.jpg",
      "Bakımsız bir yerdi",
      "27.08.2022"),
  Comment("45673783", "Ali", "https://randomuser.me/api/portraits/men/57.jpg",
      "Kalenin içini kötü yapmışlar", "27.08.2022"),
  Comment(
      "43123783",
      "Mehmet",
      "https://randomuser.me/api/portraits/men/57.jpg",
      "Merkezi yerde güzeldi",
      "27.08.2022"),
  Comment("786783753", "Adil", "https://randomuser.me/api/portraits/men/57.jpg",
      "Çok etkileyici bir yerdi", "27.08.2022"),
  Comment(
      "786753453",
      "Alperen",
      "https://randomuser.me/api/portraits/men/57.jpg",
      "Çok etkileyici bir yerdi",
      "27.08.2022"),
  Comment("grdesthsd", "Okan", "https://randomuser.me/api/portraits/men/57.jpg",
      "Çok etkileyici bir yerdi", "27.08.2022"),
  Comment(
      "dafgtanhb",
      "Gizem",
      "https://randomuser.me/api/portraits/men/57.jpg",
      "Çok etkileyici bir yerdi",
      "27.08.2022"),
  Comment(
      "adfgdafgd",
      "Hüseyin",
      "https://randomuser.me/api/portraits/men/57.jpg",
      "Çok etkileyici bir yerdi",
      "27.08.2022"),
];
