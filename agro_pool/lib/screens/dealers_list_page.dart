
import 'package:flutter/material.dart';
import 'package:agro_pool/components/dealers_details_card.dart';

class DealersListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Color(0XFF014973),
        title: Text('DealersList Screen'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              child: Center(child: Text('Dealers List',style: TextStyle(color: Colors.grey[850],fontSize: 20.0,fontWeight: FontWeight.w800),)),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: <Widget>[
                  DealerDetailsCard(dealerName: 'Sai Vardhan', offeredCost: '13,000',),
                  DealerDetailsCard(dealerName: 'Sai', offeredCost: '14,000',),
                  DealerDetailsCard(dealerName: 'Arun Sai', offeredCost: '13,500',),
                  DealerDetailsCard(dealerName: 'Vardhan', offeredCost: '14,600', ),
                  DealerDetailsCard(dealerName: 'Mani', offeredCost: '16,000',),
                  DealerDetailsCard(dealerName: 'Aravind', offeredCost: '15,000', ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


