// ignore_for_file: file_names, prefer_final_fields, sized_box_for_whitespace, unnecessary_string_interpolations, sort_child_properties_last, use_super_parameters, deprecated_member_use

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

    /// 🔥 Dummy Wallet Data
    appController.userBalance.value = {
      "_id": "69a1a32cf8c23849319467dd",
      "userId": "69a192ee15ec4a29c9507d6e",
      "balance": 1000,
      "transactions": [
        {
          "_id": "1",
          "type": "credit",
          "description": "Wallet Funding",
          "amount": 500,
          "createdAt": "2026-02-27"
        },
        {
          "_id": "2",
          "type": "debit",
          "description": "Airtime Purchase",
          "amount": 200,
          "createdAt": "2026-02-27"
        },
        {
          "_id": "3",
          "type": "credit",
          "description": "Refund",
          "amount": 300,
          "createdAt": "2026-02-27"
        }
      ]
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor.value,
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔹 APP BAR
            Container(
              height: 110,
              padding: const EdgeInsets.only(top: 70),
              child: CommonWidgets()
                  .appBar(hasBack: true, title: "Wallet Summary"),
            ),

            /// 🔹 BODY
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: primaryBackgroundColor.value,
                  borderRadius:
                      const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      const SizedBox(height: 30),

                      /// 🔥 BALANCE CARD
                      Container(
                        width: double.infinity,
                        padding:
                            const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              primaryColor.value,
                              primaryColor.value
                                  .withOpacity(0.7),
                            ],
                          ),
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Total Balance",
                              style: TextStyle(
                                color:
                                    Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                                height: 10),
                            Text(
                              "₦ ${appController.userBalance['balance'] ?? 0}",
                              style:
                                  const TextStyle(
                                color:
                                    Colors.white,
                                fontSize: 30,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      /// 🔹 QUICK ACTIONS
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        children: [
                          _actionButton(
                              Icons.add, "Fund"),
                          _actionButton(
                              Icons.send,
                              "Transfer"),
                          _actionButton(
                              Icons
                                  .arrow_downward,
                              "Withdraw"),
                        ],
                      ),

                      const SizedBox(height: 30),

                      /// 🔹 TITLE
                      Text(
                        "Recent Transactions",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight.w600,
                          color:
                              headingColor.value,
                        ),
                      ),

                      const SizedBox(height: 15),

                      /// 🔥 TRANSACTION LIST
                      ListView.builder(
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(),
                        itemCount:
                            appController
                                    .userBalance[
                                        'transactions']
                                    ?.length ??
                                0,
                        itemBuilder:
                            (context, i) {
                          var transaction =
                              appController
                                      .userBalance[
                                  'transactions'][i];

                          bool isCredit =
                              transaction[
                                      'type'] ==
                                  "credit";

                          return Container(
                            margin:
                                const EdgeInsets
                                        .only(
                                    bottom: 15),
                            padding:
                                const EdgeInsets
                                    .all(15),
                            decoration:
                                BoxDecoration(
                              color:
                                  Colors.white,
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors
                                      .grey
                                      .withOpacity(
                                          0.05),
                                  blurRadius:
                                      10,
                                  spreadRadius:
                                      2,
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      isCredit
                                          ? Colors
                                              .green
                                              .withOpacity(
                                                  0.1)
                                          : Colors
                                              .red
                                              .withOpacity(
                                                  0.1),
                                  child: Icon(
                                    isCredit
                                        ? Icons
                                            .arrow_downward
                                        : Icons
                                            .arrow_upward,
                                    color:
                                        isCredit
                                            ? Colors
                                                .green
                                            : Colors
                                                .red,
                                  ),
                                ),
                                const SizedBox(
                                    width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                    children: [
                                      Text(
                                        transaction[
                                                'description'] ??
                                            "Transaction",
                                        style:
                                            const TextStyle(
                                          fontWeight:
                                              FontWeight
                                                  .w600,
                                        ),
                                      ),
                                      const SizedBox(
                                          height:
                                              4),
                                      Text(
                                        transaction[
                                                'createdAt'] ??
                                            "",
                                        style:
                                            const TextStyle(
                                          color: Colors
                                              .grey,
                                          fontSize:
                                              12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "${isCredit ? "+" : "-"} ₦${transaction['amount']}",
                                  style:
                                      TextStyle(
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                    color:
                                        isCredit
                                            ? Colors
                                                .green
                                            : Colors
                                                .red,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 ACTION BUTTON
Widget _actionButton(
    IconData icon, String label) {
  return Column(
    children: [
      Container(
        padding:
            const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: primaryColor.value
              .withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: primaryColor.value,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight:
              FontWeight.w500,
        ),
      )
    ],
  );
}