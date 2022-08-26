import 'package:explore_your_city/src/app/pages/app_bar/app_bar_view.dart';
import 'package:explore_your_city/src/app/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ProfileView extends View {
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _ProfileViewState(
      ProfileController(),
    );
  }
}

class _ProfileViewState extends ViewState<ProfileView, ProfileController> {
  _ProfileViewState(ProfileController controller) : super(controller);

  @override
  // TODO: implement view
  Widget get view {
    return Scaffold(
      body: Column(
        children: [
          AppBarWiev(isBackButtonActive: true),
          Text('Profil'),
        ],
      ),
    );
  }
}
