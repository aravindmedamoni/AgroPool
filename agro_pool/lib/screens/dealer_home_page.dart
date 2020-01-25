
import 'package:agro_pool/components/price_and_crops_details_card.dart';
import 'package:agro_pool/components/side_navigation_bar.dart';
import 'package:agro_pool/screens/chatscreen_page.dart';
import 'package:agro_pool/screens/dealer_profile_page.dart';
import 'package:agro_pool/screens/dealers_list_page.dart';
import 'package:agro_pool/screens/farmer_list_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


class DealerHomePage extends StatefulWidget {

  @override
  _DealerHomePageState createState() => _DealerHomePageState();
}

class _DealerHomePageState extends State<DealerHomePage> {

   int bottomBarSelectedIndex = 1;
   final tabs = [
     ChatScreen(),
     DealerHomePag(),
     DealerProfilePage(),
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Color(0XFF014973),
        title: Text('Offered Prices Screen'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(icon: Icon(Icons.near_me,size: 35.0,), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return FarmersListPage();
              }));
            }),
          )
        ],
      ),
      drawer: SideNavigationBar(),
      body: tabs[bottomBarSelectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(Icons.message,size: 30.0,),
          Icon(Icons.home,size: 30.0,),
          Icon(Icons.person,size: 30.0,),
        ],
        onTap: (index){
           setState(() {
             bottomBarSelectedIndex = index;
           });
        },
        animationDuration: const Duration(milliseconds: 250),
        height: 60.0,
        backgroundColor: bottomBarSelectedIndex == 0?bottomBarSelectedIndex == 1?Colors.grey[350]:Color(0XFF008878):Colors.blueGrey,
        color: Colors.white,
        index: bottomBarSelectedIndex,
      ),
    );
  }
}

class DealerHomePag extends StatelessWidget {
  const DealerHomePag({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            child: Center(child: Text('Dealers Offered Price To Crops',style: TextStyle(color: Colors.grey[850],fontSize: 20.0,fontWeight: FontWeight.w800),)),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom:18.0),
            child: Container(
              child: ListView(
                children: <Widget>[
                  PriceAndCropsDetailsCard(cropName: 'Paddy', offeredCost: '4,500',),
                  PriceAndCropsDetailsCard(cropName: 'Cotton', offeredCost: '5,600',),
                  PriceAndCropsDetailsCard(cropName: 'Rice', offeredCost: '4,200',),
                  PriceAndCropsDetailsCard(cropName: 'Carrot', offeredCost: '8,000', ),
                  PriceAndCropsDetailsCard(cropName: 'Groundnut', offeredCost: '5,200',),
                  PriceAndCropsDetailsCard(cropName: 'Red gram', offeredCost: '6,700', ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}


