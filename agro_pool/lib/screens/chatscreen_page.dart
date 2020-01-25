import 'package:agro_pool/screens/message_send_page.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        actions: <Widget>[
//          FlatButton(
//            onPressed: () {
//              Navigator.push(context, MaterialPageRoute(builder: (context) {
//                return NotificationsPage();
//              }));
//            },
//            child: Icon(
//              Icons.notifications_none,
//              color: Colors.white,
//              size: 30.0,
//            ),
//          ),
//        ],
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0XFF174F69),
              Color(0XFF008878),
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Chats',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),

                      SizedBox(
                        height: 15.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ChatLayout(name: 'Manikanta',msg: 'Request Send',),
                          ChatLayout(name: 'Vamsi',msg: 'Request Send',),
                          ChatLayout(name: 'Sai Vardhan',msg: 'Request Send',),
                          ChatLayout(name: 'Aravind',msg: 'Request Send',),
                          ChatLayout(name: 'Vaishnavi',msg: 'Request Send',),
                          ChatLayout(name: 'Sowmya',msg: 'Request Send',),
                          ChatLayout(name: 'Arun',msg: 'Request Send',),
                          ChatLayout(name: 'Naveen',msg: 'Request Send',),
                          ChatLayout(name: 'Sindhu',msg: 'Request Send',),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class ChatLayout extends StatelessWidget {
  const ChatLayout({
    Key key, this.name, this.msg
  }) : super(key: key);
  final String name;
  final String msg;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: RawMaterialButton(
        child: Icon(
          Icons.person_pin,
          size: 45.0,
          color: Colors.white,
        ),
        onPressed: null,
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(
          width: 76.0,
          height: 76.0,
        ),
        fillColor: Color(0xFF028D8F),
      ),
      title: Text(
        '$name'??'Sai',
        style: TextStyle(
            color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w800),
      ),
      subtitle: Text(
        '$msg'??'Hii',
        style: TextStyle(color: Colors.white),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return MessageSendPage(userName: '$name',);
        }));
      },
    );
  }
}
