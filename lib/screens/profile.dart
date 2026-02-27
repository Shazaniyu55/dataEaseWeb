import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          "https://res.cloudinary.com/damufjozr/image/upload/v1717407985/niyu_icuuru.jpg"),
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
                        const Text(
                          'Name: ${'Shazaniyu Gbadamosi'}',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Email: ${'Shazaniyu@gmail.com'}',
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
