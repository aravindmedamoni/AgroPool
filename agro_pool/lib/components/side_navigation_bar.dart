import 'package:agro_pool/components/drawer_elements.dart';
import 'package:agro_pool/services/auth_service.dart';
import 'package:agro_pool/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';

class SideNavigationBar extends StatelessWidget {
  const SideNavigationBar({ this.isSelected, this.drawerElements});
  final bool isSelected;
  final DrawerElements drawerElements;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Aravind'),
              accountEmail: Text('aravindmedamoni@gmail.com'),
              currentAccountPicture: CircleAvatar(
                radius: 60.0,
                backgroundColor: Colors.teal[50],
                child: Image.asset('images/logo.png')
              ),
              decoration: kAppBarContainerDecoration
//              BoxDecoration(
//                  gradient: LinearGradient(
//                      begin: Alignment.centerLeft,
//                      end: Alignment.centerRight,
//                      colors: [
//                    Color.fromRGBO(195, 20, 50, 1.0),
//                    Color.fromRGBO(36, 11, 54, 1.0)
//                  ])),
//                otherAccountsPictures: <Widget>[
//                  CircleAvatar(
//                    child: Text('P',style: TextStyle(color: Colors.brown, fontSize: 20.0,fontWeight: FontWeight.bold),),
//                    backgroundColor: Colors.blue[100],
//                  )
//                ],
            ),
            // all drawer elements are imported from components drawerElements class
//            DrawerElements(
//              isSelected: true,
//              tileName: 'Home',
//              tileIcon: Icons.home,
//              iconColor: Colors.deepOrange,
//              onPress: () {
//                Navigator.of(context).pop();
//              },
//            ),
            DrawerElements(
                tileName: 'Benifits',
                tileIcon: Icons.spa,
                iconColor: Colors.teal),

            DrawerElements(
                tileName: 'Agro Tips',
                tileIcon: Icons.style,
                iconColor: Colors.deepPurple),
            DrawerElements(
                tileName: 'Terms and Conditions',
                tileIcon: Icons.healing,
                iconColor: Colors.deepOrange[900]),
            DrawerElements(
                tileName: 'About Us',
                tileIcon: Icons.person,
                iconColor: Colors.purpleAccent),
            DrawerElements(
              tileName: 'Logout',
              tileIcon: Icons.exit_to_app,
              iconColor: Colors.lightGreen[800],
              onPress: () async{
                await AuthService().logOut();
              },
            ),

            SizedBox(
              width: 200.0,
              height: 2.0,
              child: Container(
                color: Colors.grey[400],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 12.0, left: 12.0, bottom: 10.0),
              child: Text(
                'Communicate',
                style: kTextFieldTextStyle.copyWith(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0),
              ),
            ),
            DrawerElements(
              tileName: 'Share',
              tileIcon: Icons.share,
              iconColor: Colors.blue,
              onPress: () async {
                PackageInfo packageInfo = await PackageInfo.fromPlatform();
                String packageName = packageInfo.packageName;
                Share.share(
                    'https://play.google.com/store/apps/details?id=' +
                        packageName,
                    subject: 'Look what I made!');
              },
            ),
            DrawerElements(
                tileName: 'Rate the App',
                tileIcon: Icons.stars,
                iconColor: Colors.deepOrange),
          ],
        ),
      ),
    );
  }
}
