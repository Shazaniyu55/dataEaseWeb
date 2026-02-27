// ignore_for_file: avoid_print, use_build_context_synchronously, sized_box_for_whitespace, file_names, use_super_parameters
import 'package:dataapp/constant/colors.dart';
import 'package:dataapp/controller/appController.dart';
import 'package:dataapp/screens/app_intro/introdudction.dart';
import 'package:dataapp/screens/app_intro/introscreenonboard.dart';
import 'package:dataapp/services/utilservice.dart';
import 'package:dataapp/widgets/bottomrectangularbtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<Introduction> _list = [
    const Introduction(
      title: 'Secure Wallet',
      subTitle: 'Get Data, Anywhere Anytime',
      imageUrl: 'images/happy.jpg',
    ),
    const Introduction(
      title: 'Exchange',
      subTitle: 'Swap Exchange with Confidence',
      imageUrl: 'images/con1.jpg',
    ),
    const Introduction(
      title: 'Pay Your Bills',
      subTitle: 'Your Wallet, Your Way',
      imageUrl: 'images/con2.jpg',
    ),
  ];
  final _appController = Get.find<AppController>();
  var hide = true.obs;
  bool canAuthenticateWithBiometrics = false;

  bool isDeviceSupported = false;
  @override
  void initState() {
    showBtn();
    checkTheme();
    super.initState();
  }

  showBtn() {
    Future.delayed(const Duration(milliseconds: 100), () {
      hide.value = false;
    });
  }

  checkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('isDarkMode')) {
      _appController.isDark.value = (prefs.getBool('isDarkMode'))!;
      _appController.changeTheme();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: lightColor,

              // Status bar brightness (optional)
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            elevation: 0,
          ),
        ),
        backgroundColor: primaryBackgroundColor.value,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 290 / 290,
                    child: Image.asset(
                      'images/logo.png',
                      fit: BoxFit.contain,
                      color: primaryColor.value,
                      width: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'DataEase',
                    style: TextStyle(
                      fontFamily: 'sfpro',
                      color: primaryColor.value,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 39.0,
                      letterSpacing: 0.64125,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Mega Data just got even better',
                    style: TextStyle(
                        fontFamily: 'sfpro',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        letterSpacing: 0.37,
                        color: labelColor.value),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              UtilService.firstLaunch == true && hide.value == false
                  ? Column(
                      children: [
                        BottomRectangularBtn(
                            onTapFunc: () {
                              Get.offAll(
                                  IntroScreenOnboarding(
                                    introductionList: _list,
                                    onTapSkipButton: () {
                                      //Get.offAll(Login(), duration: Duration(milliseconds: 300), transition: Transition.rightToLeft);
                                    },
                                  ),
                                  duration: const Duration(milliseconds: 300),
                                  transition: Transition.rightToLeft);
                            },
                            btnTitle: 'Get Started'),
                        const SizedBox(
                          height: 55,
                        )
                      ],
                    )
                  : Container(
                      height: 105,
                      width: Get.width,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
