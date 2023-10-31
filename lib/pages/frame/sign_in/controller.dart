import 'dart:convert';

import 'package:chatty/common/apis/apis.dart';
import 'package:chatty/common/entities/entities.dart';
import 'package:chatty/common/routes/names.dart';
import 'package:chatty/common/store/store.dart';
import 'package:chatty/common/widgets/toast.dart';
import 'package:chatty/pages/frame/sign_in/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  SignInController();

  final state = SignInState();

  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['openid']);

  void handleSignIn(String type) async {
    try {
      if (type == "phonenumber") {
        if (kDebugMode) {
          print("... your are logging in with phone numbile");
        }
      } else if (type == "google") {
        var user = await googleSignIn.signIn();
        if (user != null) {
          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ?? "assets/icons/google.png";
          LoginRequestEntity loginPanelRequestEntity = LoginRequestEntity();
          loginPanelRequestEntity.avatar = photoUrl;
          loginPanelRequestEntity.name = displayName;
          loginPanelRequestEntity.email = email;
          loginPanelRequestEntity.open_id = id;
          loginPanelRequestEntity.type = 2;
          print(jsonEncode(loginPanelRequestEntity));
          asyncPostAllData(loginPanelRequestEntity);
        }
      } else {
        if (kDebugMode) {
          print("Not Sure");
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("....error with login $error");
      }
    }
  }

  asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    /*
    Save at the database then save locally
    */
    // if (kDebugMode) {
    //   print('Error on message page');
    // }
    // var response = await HttpUtil().get(
    //   '/api/index',
    // );
    // if (kDebugMode) {
    //   print(response);
    // }
    // UserStore.to.setIsLogin=true;

    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserAPI.Login(params: loginRequestEntity);
    print(
        "AsyncPostAllData Return Access Token:--------- ${result.data!.access_token}");

    if (result.code == 0) {
      await UserStore.to.saveProfile(result.data!);
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: "Internet Error");
    }

    Get.offAllNamed(AppRoutes.Message);
  }
}
