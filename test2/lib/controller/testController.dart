import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:test2/model/model.dart';
import 'dart:developer' as developer;

class TestController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  bool isLoading = false;
  Model model = Model();
  void fetchDate(String url) async {
    try {
      isLoading == true;
      update();
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        model = Model.fromJson(data);
        isLoading == false;
        update();
        print(model);
        print(data);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      GetUtils.snakeCase(e.toString());
    }
  }
}
