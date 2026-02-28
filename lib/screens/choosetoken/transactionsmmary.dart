// ignore_for_file: file_names, prefer_final_fields, sized_box_for_whitespace, unnecessary_string_interpolations, sort_child_properties_last, use_super_parameters, invalid_use_of_protected_member, deprecated_member_use

import 'package:dataapp/constant/colors.dart';
import 'package:dataapp/controller/appController.dart';
import 'package:dataapp/widgets/commonwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionSummary extends StatefulWidget {
  const TransactionSummary({Key? key, this.fromPage}) : super(key: key);
  final String? fromPage;

  @override
  State<TransactionSummary> createState() => _TransactionSummaryState();
}

class _TransactionSummaryState extends State<TransactionSummary> {
  final appController = Get.find<AppController>();

  @override
  void initState() {
    super.initState();
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
        "createdAt": "2026-02-27T10:30:00.000Z"
      },
      {
        "_id": "2",
        "type": "debit",
        "description": "Airtime Purchase",
        "amount": 200,
        "createdAt": "2026-02-27T12:00:00.000Z"
      },
      {
        "_id": "3",
        "type": "credit",
        "description": "Refund",
        "amount": 300,
        "createdAt": "2026-02-27T14:16:06.703Z"
      }
    ]
  };

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
                    .appBar(hasBack: true, title: "Transaction Summary"),
              ),
              Expanded(
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      color: primaryBackgroundColor.value,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: appController.getBalanceLoader.value
        ? const Center(child: CircularProgressIndicator())
        : appController.userBalance['transactions'] == null ||
                appController.userBalance['transactions'].isEmpty
            ? Center(
                child: Text(
                  "No transactions yet",
                  style: TextStyle(
                    color: labelColor.value,
                    fontSize: 14,
                  ),
                ),
              )
            : ListView.builder(
                padding:
                    const EdgeInsets.only(top: 30, bottom: 40),
                itemCount: appController
                    .userBalance['transactions'].length,
                itemBuilder: (context, i) {
                  var transaction =
                      appController.userBalance['transactions'][i];

                  bool isCredit =
                      transaction['type'] == "credit";

                  return Container(
                    margin:
                        const EdgeInsets.only(bottom: 15),
                    padding:
                        const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: cardColor.value,
                      borderRadius:
                          BorderRadius.circular(15),
                      boxShadow: appShadow.value,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isCredit
                                ? Colors.green
                                    .withOpacity(0.1)
                                : Colors.red
                                    .withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isCredit
                                ? Icons.arrow_downward
                                : Icons.arrow_upward,
                            color: isCredit
                                ? Colors.green
                                : Colors.red,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 15),
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
                                style: TextStyle(
                                  fontWeight:
                                      FontWeight.w600,
                                  fontSize: 15,
                                  color:
                                      headingColor.value,
                                ),
                              ),
                              const SizedBox(
                                  height: 4),
                              Text(
                                transaction[
                                        'createdAt'] ??
                                    "",
                                style: TextStyle(
                                  fontSize: 12,
                                  color:
                                      labelColor.value,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "${isCredit ? "+" : "-"} ₦${transaction['amount']}",
                          style: TextStyle(
                            fontWeight:
                                FontWeight.bold,
                            fontSize: 14,
                            color: isCredit
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
  ),
)
            ],
          ),
        ),
      ),
    );
  }
}
