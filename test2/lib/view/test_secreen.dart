import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';
import 'package:test2/const/ApiConfig.dart';
import 'package:test2/controller/testController.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestController>(
        init: TestController(),
        builder: (testController) {
          return Scaffold(
            appBar: AppBar(
              title: Text("test"),
              centerTitle: true,
            ),
            body: Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              testController.fetchDate(endPointOne);
                              testController.update();
                            },
                            child: Text("Fetch Data A")),
                        ElevatedButton(
                            onPressed: () {
                              testController.fetchDate(endPointTow);
                              testController.update();
                            },
                            child: Text("Fetch Data B"))
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return ConnectivityBuilder(
                              builder: (status) {
                                if (status == ConnectivityStatus.online) {
                                  return testController.model.title == null
                                      ? Container()
                                      : Container(
                                          child: Column(
                                            children: [
                                              // _dataCard(testController.model.userId
                                              //     .toString()),
                                              _dataCard(
                                                  testController.model.title ??
                                                      ''),
                                              // _dataCard(
                                              //     testController.model.completed ==
                                              //             true
                                              //         ? "True"
                                              //         : "false"),
                                            ],
                                          ),
                                        );
                                  //return CircularProgressIndicator();
                                } else if (status ==
                                    ConnectivityStatus.offline) {
                                  return Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                        "Make sure your Connect to internet"),
                                  );
                                }
                                return CircularProgressIndicator();
                              },
                            );
                          }),
                    ),
                  ],
                )),
          );
        });
  }

  // final random = Random();
  Widget _dataCard(String title) {
    return AnimatedContainer(
      curve: Curves.slowMiddle,
      height: 60,
      width: Get.width,
      duration: Duration(seconds: 1),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(0.6, 0.3), blurRadius: 13, color: Colors.grey)
        ],
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          FadeAnimatedText(
            title,
            textStyle: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            //speed: const Duration(milliseconds: 2000),
          ),
        ],
        totalRepeatCount: 4,
        pause: const Duration(milliseconds: 1000),
        displayFullTextOnTap: true,
        stopPauseOnTap: true,
      ),
    );
  }
}
