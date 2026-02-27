// ignore_for_file: use_super_parameters, sized_box_for_whitespace, deprecated_member_use, avoid_print

import 'package:dataapp/assistant/assistant.dart';
import 'package:dataapp/constant/colors.dart';
import 'package:dataapp/controller/appController.dart';
import 'package:dataapp/model/walletBalace.dart';
import 'package:dataapp/screens/airtime.dart';
import 'package:dataapp/screens/betting.dart';
import 'package:dataapp/screens/cable.dart';
import 'package:dataapp/screens/choosetoken/transactionsmmary.dart';
import 'package:dataapp/screens/choosetoken/walletsummary.dart';
import 'package:dataapp/screens/data.dart';
import 'package:dataapp/screens/electricity.dart';
import 'package:dataapp/screens/listvendors.dart';
import 'package:dataapp/screens/profile.dart';
import 'package:dataapp/widgets/commonwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentMax = 1;
  AppController appController = Get.find<AppController>();
  var selectedCoinToBalanceModel = Balance().obs;
  var selectCoin = 0.obs;
  // Wallet balance variable
  double walletBalance = 0.0;
  late VtuApi vtuApi;

  @override
  void initState() {
    super.initState();
    _loadBalance();
    vtuApi = VtuApi();
  }

  Future<void> _loadBalance() async {
  try {
    final result = await vtuApi.checkBalance();

    setState(() {
      walletBalance = double.tryParse(
        result["data"]["balance"].toString(),
      ) ?? 0.0;
    });

  } catch (e) {
    print("Error fetching balance: $e");
  }
}

  // Future<void> _loadBalance() async {
  //   try {
  //     final result = await vtuApi.checkBalance();
  //     setState(() {
  //       walletBalance = double.tryParse(result["balance"].toString()) ?? 0.0;
  //     });
  //   } catch (e) {
  //     print("Error fetching balance: $e");
  //   }
  // }

  // Fetch balance from VTU.ng API

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: appBgGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _loadBalance, // refresh balance manually
            ),
          ],
          backgroundColor: primaryColor.value,
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: primaryColor.value,
            // Status bar brightness (optional)
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text(
                  "Shazaniyu Gbadamosi",
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: Text("shazaniyu@gmail.com",
                    style: TextStyle(color: Colors.white)),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://res.cloudinary.com/damufjozr/image/upload/v1717407985/niyu_icuuru.jpg"),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.8, 1),
                    colors: <Color>[
                      Color(0xff1f005c),
                      Color.fromARGB(255, 59, 15, 219),
                      Color.fromARGB(255, 65, 129, 223),
                      Color.fromARGB(255, 21, 132, 192),
                      Color.fromARGB(255, 55, 132, 225),
                      Color.fromARGB(255, 100, 123, 239),
                      Color.fromARGB(255, 44, 47, 227),
                      Color.fromARGB(255, 107, 171, 255),
                    ],
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://res.cloudinary.com/damufjozr/image/upload/v1717407985/niyu_icuuru.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.hourglass_bottom_outlined,
                  color: Colors.blueAccent,
                  size: 30,
                ),
                title: const Text("Pricing"),
                onTap: () {
                  Get.to(const Profile());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.blueAccent,
                  size: 30,
                ),
                title: const Text("Settings"),
                onTap: () {
                  Get.to(const Profile());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: const Icon(
                  Icons.people_alt,
                  color: Colors.blueAccent,
                  size: 30,
                ),
                title: const Text("About us"),
                onTap: () {
                  Get.to(const Profile());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: const Icon(
                  Icons.message_sharp,
                  color: Colors.blueAccent,
                  size: 30,
                ),
                title: const Text("Complaints"),
                onTap: () {
                  Get.to(const Profile());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: const Icon(
                  Icons.person_3,
                  color: Colors.blueAccent,
                  size: 30,
                ),
                title: const Text("Profile"),
                onTap: () {
                  Get.to(const Profile());
                },
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(
                  Icons.chat,
                  color: Colors.blueAccent,
                  size: 30,
                ),
                title: const Text("Chat"),
                onTap: () {
                  Get.to(const ListOfVendors());
                },
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app,
                  color: Colors.blueAccent,
                  size: 30,
                ),
                title: const Text("Log out"),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Obx(
          () => Container(
            height: Get.height,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 210,
                      padding:
                          const EdgeInsets.only(top: 30, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(height: 30),
                          Container(
                            width: Get.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Wallet Balance',
                                  style: TextStyle(
                                    fontFamily: 'sfpro',
                                    color: lightColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                    letterSpacing: 0.37,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "₦${walletBalance.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontFamily: 'sfpro',
                                    color: lightColor,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 40.0,
                                    letterSpacing: 0.36,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        decoration: BoxDecoration(
                          color: primaryBackgroundColor.value,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 60),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                _buildCard(
                                    context, "images/phone.png", "Airtime", () {
                                  Get.to(const AirtimeScreen());
                                }),
                                _buildCard(
                                    context, "images/data.png", "Buy Data", () {
                                  Get.to(const DataScreen());
                                }),
                                _buildCard(
                                    context, "images/light.png", "Electric",
                                    () {
                                  Get.to(const ElectricScreen());
                                }),
                                _buildCard(context, "images/tv.png", "Cable",
                                    () {
                                  Get.to(const CableScreen());
                                }),
                                _buildCard(context, "images/bet.png", "Betting",
                                    () {
                                  Get.to(const BettingScreen());
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 170,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: Get.width - 32,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: cardColor.value,
                        boxShadow: appShadow,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: Row(
                        children: [
                          _dashBTns(
                            svg: 'wallet',
                            btnText: 'Fund wallet',
                            onTap: () {
                              CommonWidgets()
                                  .selectWithdrawBottomSheet(context);
                            },
                          ),
                          const SizedBox(width: 20),
                          _dashBTns(
                            svg: 'transac',
                            btnText: 'Transactions',
                            onTap: () {
                              Get.to(const TransactionSummary());
                            },
                          ),
                          _dashBTns(
                            svg: 'sum',
                            btnText: 'Wallet Summary',
                            onTap: () {
                              Get.to(const WalletSummary());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, String imagePath, String text, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xffD8D9E4)),
                  ),
                  child: CircleAvatar(
                    radius: 22.0,
                    backgroundColor: primaryColor.value,
                    child: ClipOval(
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                  ),
                ),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dashBTns({String? svg, String? btnText, Function? onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      'images/$svg.png',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '$btnText',
                style: TextStyle(
                  fontFamily: 'sfpro',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  letterSpacing: 0.37,
                  color: inputFieldTextColor.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
