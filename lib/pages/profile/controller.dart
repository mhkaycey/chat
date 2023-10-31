import 'package:chatty/common/store/store.dart';
import 'package:chatty/pages/profile/index.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileController extends GetxController {
  ProfileController();

  final state = ProfileState();

  void goLogut() async {
    await GoogleSignIn().signOut();
    await UserStore.to.onLogout();
  }
}
