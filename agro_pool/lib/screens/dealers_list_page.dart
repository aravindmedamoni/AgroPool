
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
                  DealerDetailsCard(dealerName: 'Naveen', offeredCost: '13,000',),
                  DealerDetailsCard(dealerName: 'Anji', offeredCost: '14,000',),
                  DealerDetailsCard(dealerName: 'Chinna', offeredCost: '13,500',),
                  DealerDetailsCard(dealerName: 'Shankar', offeredCost: '14,600', ),
                  DealerDetailsCard(dealerName: 'Shiva Krishna', offeredCost: '16,000',),
                  DealerDetailsCard(dealerName: 'Ravi', offeredCost: '15,000', ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


