import 'package:explore_your_city/src/app/constants/constants.dart';
import 'package:explore_your_city/src/app/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../../data/repositories/data_user_repository.dart';
import 'app_bar_controller.dart';

class AppBarWiev extends View {
  late bool isBackButtonActive = false;
  AppBarWiev({required this.isBackButtonActive});
  @override
  State<StatefulWidget> createState() {
    return _AppBarWievState(
      AppBarController(),
    );
  }
}

class _AppBarWievState extends ViewState<AppBarWiev, AppBarController> {
  _AppBarWievState(AppBarController controller) : super(controller);

  @override
  // TODO: implement view
  Widget get view {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Container(
      padding: EdgeInsets.only(top: padding.top, left: 20, right: 20),
      color: cBlue,
      width: size.width,
      height: size.height / 7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: widget.isBackButtonActive != true
                ? ControlledWidgetBuilder<AppBarController>(
                    builder: (context, controller) {
                    return Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: cWhite,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              DataUserRepository().user.imageUrl,
                            )),
                      ),
                    );
                  })
                : Icon(Icons.keyboard_backspace,
                    size: size.height * 0.055, color: cWhite),
            onTap: () {
              if (!widget.isBackButtonActive) {
                Scaffold.of(context).openDrawer();
              } else {
                Navigator.pop(context);
              }
            },
          ),
          Text(
            "KAYSERİ",
            style: kLargeTitleStyle(cWhite),
          ),
          ControlledWidgetBuilder<AppBarController>(
              builder: (context, controller) {
            return InkWell(
              child: Icon(
                Icons.add_circle_outline_rounded,
                color: cWhite,
                size: size.height * 0.05,
              ),
              onTap: () {
                controller.refreshView();
              },
            );
          }),
        ],
      ),
    );
  }
}
