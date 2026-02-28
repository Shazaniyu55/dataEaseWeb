import 'package:dataapp/assistant/assistant.dart';
import 'package:dataapp/controller/appController.dart';
import 'package:dataapp/model/walletBalace.dart';
import 'package:dataapp/services/tokenServie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  // ignore: use_super_parameters
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}





class _ProfileState extends State<Profile> {

    late TokenService tokenService;
  int currentMax = 1;
  AppController appController = Get.find<AppController>();
  var selectedCoinToBalanceModel = Balance().obs;
  var selectCoin = 0.obs;
  double walletBalance = 0.0;
  late VtuApi vtuApi;


  Future<void> _initializeDashboard() async {
  try {
    final token = await tokenService.getToken();
    final userId = await tokenService.getUserId();

    if (token == null || userId == null) {
      return;
    }

    await _loadUserProfile(token, userId);

  // ignore: empty_catches
  } catch (e) {
  }
}


Future<void> _loadUserProfile(String token, String userId) async {
  try {
    final profile = await vtuApi.getUserProfile(token, userId);


    setState(() {
      // Example
      appController.userName.value = profile["fullName"];
      appController.email.value = profile["email"];
      appController.img.value = profile["profilePic"] ?? '';
    });

  // ignore: empty_catches
  } catch (e) {
  }
}


   @override
  void initState() {
    super.initState();
    tokenService = TokenService();
    vtuApi = VtuApi();
    _initializeDashboard();
    
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text("Profile"),
        ),
        body: CustomScaffold(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child:  CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                           appController.img.value.isNotEmpty
                              ? appController.img.value
                              : "https://www.pngall.com/wp-content/uploads/5/Profile-PNG-High-Quality-Image.png",),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Positioned(
                          bottom: -20,
                          right: 20,
                          child: IconButton(
                            onPressed: () async {},
                            icon: const Icon(Icons.add_a_photo_rounded),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Expanded(
                flex: 5,
                child: SizedBox(
                  height: 10,
                ),
              ),
              Expanded(
                flex: 40,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.fromLTRB(60.0, 60.0, 25.0, 20.0),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit_note_rounded,
                              size: 30,
                            ),
                          ),
                        ),
                        const Text(
                          "Basic Detalis",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         Obx(()=> Text(
                          'Full Name: ${appController.userName.value}',)
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         Obx(()=> Text(
                          'Email: ${appController.email.value}',)
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      extendBody: true,
      body: Stack(
        children: [SafeArea(child: child!)],
      ),
    );
  }
}
