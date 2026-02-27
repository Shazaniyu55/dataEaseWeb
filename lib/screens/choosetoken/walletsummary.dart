// ignore_for_file: file_names, prefer_final_fields, sized_box_for_whitespace, unnecessary_string_interpolations, sort_child_properties_last, use_super_parameters

import 'package:dataapp/constant/colors.dart';
import 'package:dataapp/controller/appController.dart';
import 'package:dataapp/widgets/commonwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletSummary extends StatefulWidget {
  const WalletSummary({Key? key, this.fromPage}) : super(key: key);
  final String? fromPage;

  @override
  State<WalletSummary> createState() => _WalletSummaryState();
}

class _WalletSummaryState extends State<WalletSummary> {
  final appController = Get.find<AppController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor.value,
      body: Obx(
        () => Container(
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 110,
                padding: const EdgeInsets.only(top: 70),
                child: CommonWidgets()
                    .appBar(hasBack: true, title: "Wallet Summary"),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  decoration: BoxDecoration(
                    color: primaryBackgroundColor.value,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  //constraints: BoxConstraints(minHeight: Get.height - 240, minWidth: Get.width),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        children: [
                          Text(
                            'Wallet',
                            style: TextStyle(
                              color: headingColor.value,
                              fontFamily: 'sfpro',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 26.0,
                              letterSpacing: 0.36,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount:
                              appController.userBalance.value.balance?.length,
                          padding: const EdgeInsets.only(top: 10, bottom: 40),
                          itemBuilder: (context, i) {
                            return const Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
