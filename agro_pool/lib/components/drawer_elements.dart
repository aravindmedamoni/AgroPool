
import 'package:flutter/material.dart';
import 'package:agro_pool/utils/constants.dart';

class DrawerElements extends StatelessWidget {

  final String tileName;
  final IconData tileIcon;
  final Color iconColor;
  final Function onPress;
  final bool isSelected;


  DrawerElements({@required this.tileName, @required this.tileIcon, @required this.iconColor, this.onPress, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected:isSelected??false,
      title:isSelected == true?Text(tileName, style: kTextFieldTextStyle.copyWith(
        color: Colors.blue,
          fontSize: 16.0,
          fontWeight: FontWeight.w500
      ),) : Text(tileName,style: kTextFieldTextStyle.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w500
      ),),
      leading: Icon(tileIcon,color: iconColor,size: 26.0,),
      onTap: onPress,
    );
  }
}
