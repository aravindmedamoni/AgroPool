import 'package:agro_pool/screens/dealers_list_page.dart';
import 'package:agro_pool/screens/login_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:agro_pool/utils/constants.dart';
import 'package:agro_pool/components/drawer_elements.dart';
import 'package:toast/toast.dart';
import 'package:agro_pool/components/rounded_rectangle_button.dart';
import 'package:share/share.dart';
import 'package:package_info/package_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Getting Firebase intance
  final _auth = FirebaseAuth.instance;

  List<String> crops = ['Select Crop','Paddy','Cotton','Rice','Carrot','Groundnut'];

  List<String> district = ['Select District','Ranga Reddy','Hyderabad','MahabubNagar','Nagar Kurnool','KarimNagar','Sidhipet','Janagama','Vanaparthy'];

  String selectedCrop = 'Select Crop';

  String selectedDistrict = 'Select District';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF014973),
        title: Text("Agro Pool"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: IconButton(icon: Icon(Icons.power_settings_new,size: 26.0, color: Colors.white,), onPressed: (){
              _auth.signOut();
              Toast.show('You logout succuessfully.', context,backgroundRadius: 16.0);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return LoginPage();
              }));
            }),
          )
        ],
      ),
      drawer: new Drawer(
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
                  child: Icon(Icons.spa,size: 40.0,),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color.fromRGBO(195,20, 50,1.0),Color.fromRGBO(36,11, 54,1.0)])
                ),
//                otherAccountsPictures: <Widget>[
//                  CircleAvatar(
//                    child: Text('P',style: TextStyle(color: Colors.brown, fontSize: 20.0,fontWeight: FontWeight.bold),),
//                    backgroundColor: Colors.blue[100],
//                  )
//                ],
              ),
              // all drawer elements are imported from components drawerElements class
              DrawerElements(tileName: 'Home',
                  tileIcon: Icons.home,
                  iconColor: Colors.deepOrange,
                onPress: (){
                Navigator.of(context).pop();
                },
              ),
              DrawerElements(tileName: 'Insurance', tileIcon: Icons.spa, iconColor: Colors.teal),
              DrawerElements(tileName: 'Agro Tips', tileIcon: Icons.featured_play_list, iconColor: Colors.green[900]),
              DrawerElements(tileName: 'Terms and Conditions', tileIcon: Icons.healing, iconColor: Colors.deepOrange[900]),
              DrawerElements(tileName: 'Dealer Login', tileIcon: Icons.exit_to_app, iconColor: Colors.lightGreen[800], onPress: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return LoginPage();
                }));
              },),

              SizedBox(
                width:200.0,
                height: 2.0,
                child: Container(
                  color: Colors.grey[400],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0,left: 12.0,bottom: 10.0),
                child: Text('Communicate',style: kTextFieldTextStyle.copyWith(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0
                ),),
              ),
              DrawerElements(tileName: 'Share', tileIcon: Icons.share, iconColor: Colors.blue, onPress: () async{
                PackageInfo packageInfo = await PackageInfo.fromPlatform();
                String packageName = packageInfo.packageName;
                Share.share('https://play.google.com/store/apps/details?id='+packageName, subject: 'Look what I made!');
              },),
             DrawerElements(tileName: 'Rate the App', tileIcon: Icons.stars, iconColor: Colors.deepOrange),

            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[100],
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(child: Text('Crop & District Selection Screen',style: TextStyle(color: Colors.brown[700],fontSize: 20.0,fontWeight: FontWeight.bold),),),
             SizedBox(
               height: 30.0,
             ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Select Crop:',style: TextStyle(color: Colors.brown[700],fontSize: 16.0,fontWeight: FontWeight.w500),),
                  SizedBox(
                    width: 30.0,
                  ),
                  // for crops
                  DropdownButton<String>(
                      itemHeight: 50.0,
                      items: crops.map<DropdownMenuItem<String>>((String dropDownMenuItem){
                        return DropdownMenuItem(
                          value: dropDownMenuItem,
                          child: Text(dropDownMenuItem),);
                      }).toList(),
                      value: selectedCrop,
                      elevation: 20,
                      style: TextStyle(
                        color: Colors.grey[900],
                      ),
                      icon: Icon(Icons.arrow_downward),
                      onChanged: (newCropName){
                        setState(() {
                          selectedCrop = newCropName;
                        });
                      },
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Select District:',style: TextStyle(color: Colors.brown[700],fontSize: 16.0,fontWeight: FontWeight.w500),),
                  SizedBox(
                    width: 30.0,
                  ),
                  DropdownButton<String>(
                    itemHeight: 50.0,
                    items: district.map<DropdownMenuItem<String>>((String dropDownMenuItem){
                      return DropdownMenuItem(
                        value: dropDownMenuItem,
                        child: Text(dropDownMenuItem),);
                    }).toList(),
                    value: selectedDistrict,
                    elevation: 20,
                    style: TextStyle(
                      color: Colors.grey[900],
                    ),
                    icon: Icon(Icons.arrow_downward),
                    onChanged: (newCropName){
                      setState(() {
                        selectedDistrict = newCropName;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: RoundedRectangleButton(
                    onPress: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return DealersListPage();
                      }));
                    },
                    buttonName: 'Check',
                    buttonColor: Colors.deepPurple,
                    borderColor: Colors.purpleAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

