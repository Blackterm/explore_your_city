import 'package:explore_your_city/src/domain/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../../data/repositories/data_user_repository.dart';

class AppBarController extends Controller {
  User user = DataUserRepository().user;

  @override
  void onInitState() async {
    refreshUI();
    super.onInitState();
  }

  @override
  void dispose() {}

  @override
  void initListeners() {}

  void refreshView() {
    refreshUI();
  }
}
