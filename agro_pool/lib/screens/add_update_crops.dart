
import 'package:agro_pool/components/rounded_rectangle_button.dart';
import 'package:flutter/material.dart';

class AddUpdateCrops extends StatefulWidget {

  final String title;
  AddUpdateCrops({@required this.title});

  @override
  _AddUpdateCropsState createState() => _AddUpdateCropsState();
}

class _AddUpdateCropsState extends State<AddUpdateCrops> {

  final List<String> crops = ['Select Crop','Brinjal','Onions','Potato','Carrot','Lady Finger','Tomato'];
  String selectedCrop = 'Select Crop';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
        backgroundColor: Color(0XFF014973),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[350],
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 20.0),
              child: Text('Add Crop', style: TextStyle(color: Colors.purple,fontSize: 26.0,fontWeight: FontWeight.w800),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Select Crop :',style: TextStyle(color: Colors.brown[700],fontSize: 18.0,fontWeight: FontWeight.w500),),
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
                    fontSize: 18.0,
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
            Padding(
              padding: const EdgeInsets.only(right: 40.0,top: 40.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: RoundedRectangleButton(onPress: (){
                    Navigator.of(context).pop();
                  }, buttonName: '${widget.title}', buttonColor: Colors.deepPurple)),
            )
          ],
        ),
      ),
    ));
  }
}
