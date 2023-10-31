import 'package:chatty/common/apis/apis.dart';
import 'package:chatty/common/entities/contact.dart';
import 'package:chatty/pages/contact/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../common/store/store.dart';

class ContactController extends GetxController {
  ContactController();
  final title = "Contact .";
  final state = ContactState();
  final token = UserStore.to.profile.token;

  @override
  void onReady() async {
    super.onReady();
    asyncLoadAllData();
  }

  asyncLoadAllData() async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator.adaptive(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );

    state.contantList.clear();
    var result = await ContactAPI.post_contact();
    print("Contact ${result.data}");
    if (result.code == 0) {
      state.contantList.addAll(result.data!);
    }
    EasyLoading.dismiss();
  }

  void goChat(ContactItem item) {}
}
