import 'package:agro_pool/components/fancy_floating_action_button.dart';
import 'package:agro_pool/components/side_navigation_bar.dart';
import 'package:agro_pool/screens/add_update_crops.dart';
import 'package:agro_pool/screens/chatscreen_page.dart';
import 'package:agro_pool/screens/dealers_list_page.dart';
import 'package:agro_pool/screens/farmer_profile_page.dart';
import 'package:agro_pool/services/auth_service.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:agro_pool/components/rounded_rectangle_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FarmerHomePage extends StatefulWidget {
  @override
  _FarmerHomePageState createState() => _FarmerHomePageState();
}

class _FarmerHomePageState extends State<FarmerHomePage> {

  //Getting the AuthService Object
  final AuthService _authService = AuthService();

  //BottomBar index to show particular screen
  int bottomBarSelectedIndex = 1;

  final tabs = [
    ChatScreen(),
    FarmerHomeScreen(),
    FarmerProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF014973),
        title: Text("Agro Pool"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                icon: Icon(
                  Icons.power_settings_new,
                  size: 26.0,
                  color: Colors.white,
                ),
                onPressed: () async{
                 await _authService.logOut();
                }),
          )
        ],
      ),
      drawer: SideNavigationBar(),
      body: tabs[bottomBarSelectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(
            Icons.message,
            size: 30.0,
          ),
          Icon(
            Icons.home,
            size: 30.0,
          ),
          Icon(
            Icons.person,
            size: 30.0,
          ),
        ],
        onTap: (index) {
          setState(() {
            bottomBarSelectedIndex = index;
          });
        },
        animationDuration: const Duration(milliseconds: 150),
        height: 60.0,
        backgroundColor: indexBasedBackgroundColor(),
        color: Colors.white,
        index: bottomBarSelectedIndex,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: FancyFloatingActionButton(buttonName: 'Add Crop',onPressed: (){
          Toast.show('you are tyring to adding..', context,backgroundRadius: 18.0);
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddUpdateCrops(title:'Add Crop',);
          }));
        }),
      ),
    );
  }

 Color indexBasedBackgroundColor() {
    if(bottomBarSelectedIndex == 0){
      return Color(0XFF008878);
    }else if(bottomBarSelectedIndex == 1){
     return Colors.grey[350];
    }else{
      return Colors.blueGrey;
    }
  }
}

class FarmerHomeScreen extends StatefulWidget {
  @override
  _FarmerHomeScreenState createState() => _FarmerHomeScreenState();
}

class _FarmerHomeScreenState extends State<FarmerHomeScreen> {

  List<String> crops = [
    'Select Crop',
    'Paddy',
    'Cotton',
    'Rice',
    'Carrot',
    'Groundnut'
  ];

  List<String> district = [
    'Select District',
    'Ranga Reddy',
    'Hyderabad',
    'MahabubNagar',
    'Nagar Kurnool',
    'KarimNagar',
    'Sidhipet',
    'Janagama',
    'Vanaparthy'
  ];

  String selectedCrop = 'Select Crop';

  String selectedDistrict = 'Select District';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[350],
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'Crop & District Selection Screen',
                style: TextStyle(
                    color: Colors.brown[700],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Select Crop:',
                  style: TextStyle(
                      color: Colors.brown[700],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 30.0,
                ),
                // for crops
                DropdownButton<String>(
                  itemHeight: 50.0,
                  items: crops.map<DropdownMenuItem<String>>(
                          (String dropDownMenuItem) {
                        return DropdownMenuItem(
                          value: dropDownMenuItem,
                          child: Text(dropDownMenuItem),
                        );
                      }).toList(),
                  value: selectedCrop,
                  elevation: 20,
                  style: TextStyle(
                    color: Colors.grey[900],
                  ),
                  icon: Icon(Icons.arrow_downward),
                  onChanged: (newCropName) {
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
                Text(
                  'Select District:',
                  style: TextStyle(
                      color: Colors.brown[700],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 30.0,
                ),
                DropdownButton<String>(
                  itemHeight: 50.0,
                  items: district.map<DropdownMenuItem<String>>(
                          (String dropDownMenuItem) {
                        return DropdownMenuItem(
                          value: dropDownMenuItem,
                          child: Text(dropDownMenuItem),
                        );
                      }).toList(),
                  value: selectedDistrict,
                  elevation: 20,
                  style: TextStyle(
                    color: Colors.grey[900],
                  ),
                  icon: Icon(Icons.arrow_downward),
                  onChanged: (newCropName) {
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
                    if(selectedCrop !='Select Crop' && selectedDistrict !='Select District'){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            selectedDistrict = 'Select District';
                            selectedCrop = 'Select Crop';
                            return DealersListPage();
                          }));
                    }else {
                      Toast.show('Please Select Crop and District', context,backgroundRadius: 18.0);
                    }

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
    );
  }
}
