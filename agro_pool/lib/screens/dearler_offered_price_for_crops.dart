
import 'package:agro_pool/components/price_and_crops_details_card.dart';
import 'package:agro_pool/screens/dealer_profile_page.dart';
import 'package:flutter/material.dart';


class DealersOfferedPriceToCropsPage extends StatelessWidget {
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
            child: IconButton(icon: Icon(Icons.person_pin,size: 35.0,), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return DealerProfilePage();
              }));
            }),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              child: Center(child: Text('Dealers Offered Price To Crops',style: TextStyle(color: Colors.grey[850],fontSize: 20.0,fontWeight: FontWeight.w800),)),
            ),
          ),
          Expanded(
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
          )
        ],
      ),
    );
  }
}


