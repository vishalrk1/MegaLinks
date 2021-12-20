import 'package:flutter/material.dart';
import 'package:onikiri_ui/Colors.dart';
import 'package:onikiri_ui/FeedBack/feedBack_Screen.dart';
import 'package:onikiri_ui/Pack%20Request%20Page/Request_Screen.dart';
import 'package:share_plus/share_plus.dart';

import '../HomePage/homePage_screen.dart';
import 'package:onikiri_ui/Input%20Screens/SubmitData_Screen.dart';
import 'package:onikiri_ui/Screens/About_Scree.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
// Header of Drawer with onikiri widgets................................
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                child: ClipOval(
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
// home button.........................................................
          Drawerbuttons(
            btnTitle: "Home",
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(HomePageScreen.routeName);
            },
          ),

          Divider(
            color: bodyTextColor,
          ),
          SizedBox(
            height: 15,
          ),
// getting uers data...................................................
          Drawerbuttons(
            btnTitle: "Submit Your Data",
            icon: Icon(Icons.cloud_upload),
            onPressed: () {
              Navigator.of(context).pushNamed(DataSubmitScreen.routName);
            },
          ),
          Divider(
            color: bodyTextColor,
          ),
          SizedBox(
            height: 15,
          ),
// Scene Pack Request ...................................................
          Drawerbuttons(
            btnTitle: "Share",
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(
                  """Your invited to join MegaLink Join Us : https://www.instagram.com/megalinks.official/""");
            },
          ),
          Divider(
            color: bodyTextColor,
          ),
          SizedBox(
            height: 15,
          ),
// feedback button...................................................................................................
          Drawerbuttons(
            btnTitle: "FeedBack",
            icon: Icon(Icons.star),
            onPressed: () {
              Navigator.of(context).pushNamed(FeedBackScreen.routName);
            },
          ),
          Divider(
            color: bodyTextColor,
          ),
          SizedBox(
            height: 15,
          ),
// About us button...........................................
          Drawerbuttons(
              btnTitle: "About Us",
              icon: Icon(Icons.account_box),
              onPressed: () {
                Navigator.of(context).pushNamed(AboutScreen.routName);
              }),
          Divider(
            color: bodyTextColor,
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class Drawerbuttons extends StatelessWidget {
  final btnTitle;
  final Icon icon;
  final VoidCallback onPressed;
  const Drawerbuttons(
      {Key? key, required this.icon, required this.onPressed, this.btnTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, bottom: 10),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: 20,
            ),
            Text(
              btnTitle,
              style: TextStyle(
                color: Colors.purple,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
