import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  final image_url = "https://imgs.search.brave.com/ZsXfxLmrlKBruWMb56GFxKURg_G_4K8Q5joHabhi5u4/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMubmlnaHRjYWZl/LnN0dWRpby8vYXNz/ZXRzL29nLWRyYWdv/bi1oZWFkcGhvbmVz/LmpwZz90cj13LTE2/MDAsYy1hdF9tYXg";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.orangeAccent,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              currentAccountPicture: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(image_url),
              ),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
              ),
              accountName: Text("Gaurav Matolia",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),), 
              accountEmail: Text("gaurav.matolia@gmail.com", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)))),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.mail_solid,
                  color: Colors.white,
                ),
                title: Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
        ],
      ),
    );
  }
}