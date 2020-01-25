
import 'package:agro_pool/components/farmer_details_card.dart';
import 'package:flutter/material.dart';

class FarmersListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Color(0XFF014973),
        title: Text('FarmerList Screen'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              child: Center(child: Text('Farmers List',style: TextStyle(color: Colors.grey[850],fontSize: 20.0,fontWeight: FontWeight.w800),)),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: <Widget>[
                  FarmerDetailsCard(farmerName: 'Sai Vardhan', cropName: 'Carrot',),
                  FarmerDetailsCard(farmerName: 'Sai', cropName: 'LadyFinger',),
                  FarmerDetailsCard(farmerName: 'Vardhan', cropName: 'Pototo',),
                  FarmerDetailsCard(farmerName: 'Vamsi', cropName: 'Onions',),
                  FarmerDetailsCard(farmerName: 'Mani', cropName: 'Brinjal',),
                  FarmerDetailsCard(farmerName: 'Aravind', cropName: 'Tomato',),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


