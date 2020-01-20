
import 'package:agro_pool/components/rounded_rectangle_button.dart';
import 'package:agro_pool/screens/add_update_crops_cost_page.dart';
import 'package:flutter/material.dart';


class PriceAndCropsDetailsCard extends StatelessWidget {
  const PriceAndCropsDetailsCard({@required this.cropName, @required this.offeredCost, @required this.onPress});

  final String cropName;
  final String offeredCost;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 5.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
          child: Column(
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('Crop Name : $cropName'??'Sai Vardhan',style: TextStyle(color: Colors.grey[850],fontSize: 16.0,fontWeight: FontWeight.w400),)),
              SizedBox(
                height: 8.0,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('Offered Cost : $offeredCost'??'13,000',style: TextStyle(color: Colors.grey[850],fontSize: 16.0,fontWeight: FontWeight.w400),)),
              SizedBox(
                height: 12.0,
              ),
              Align(
                alignment: Alignment.topRight,
                child: RoundedRectangleButton(
                  buttonName: 'Update',
                  buttonColor: Colors.deepPurple,
                  onPress: onPress??(){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AddUpdateCropsCostPage();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}