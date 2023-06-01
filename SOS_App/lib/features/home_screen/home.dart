import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../utils/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Getting the current location
  // Future<Position> getcurrentposition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //   permission = await Geolocator.requestPermission();
  //   if (permission == LocationPermission.denied) {
  //     return Future.error('Location permissions are denied');
  //   }
  // }

  // if (permission == LocationPermission.deniedForever) {
  //   // Permissions are denied forever, handle appropriately.
  //   return Future.error(
  //     'Location permissions are permanently denied, we cannot request permissions.');
  // }
  // return await Geolocator.getCurrentPosition();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Home'),
        actions: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showModalBottomSheet(context);
                      },
                      child: const CircleAvatar(
                        radius: 32,
                        backgroundImage:
                            AssetImage('assets/images/blackwoman.png'),
                      ),
                    )
                  ],
                ),
              )
            ]
      ),
      body: Center(
          child: Column(
            children: [
              const Text('Logged in'),
              const SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/location');
                  },
                  child: const Text('Current location')),
            ],
          )),
    );
  }
}

Future<void> _showModalBottomSheet(BuildContext context) async {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(15),
    )),
    builder: (context) => SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text("LogOut"),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.of(context).pushNamed('/login');
                });
              },
            ),
          ],
        ),
      ),
    ),
  );
}
