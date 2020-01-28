import 'package:agro_pool/model/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageSendPage extends StatefulWidget {
  final String userName;

  MessageSendPage({this.userName});

  @override
  _MessageSendPageState createState() => _MessageSendPageState();
}

class _MessageSendPageState extends State<MessageSendPage> {

  final TextEditingController messageController = TextEditingController();

  List<Message> messages = [
    Message(msg: 'Hii'),
    Message(msg: 'Request Send'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          '${widget.userName}',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w800),
        ),
      ),
      body: Container(
        color: Colors.grey[350],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            )),
                        width: 250.0,
                        child: ListTile(
                          trailing: Icon(
                            Icons.person,
                            color: Colors.greenAccent,
                            size: 25.0,
                          ),
                          title: Text(
                            '${messages[index].msg}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 2.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: IconButton(
                              icon: Icon(
                                Icons.photo,
                                color: Colors.blueGrey,
                                size: 30.0,
                              ),
                              onPressed: null)),
                      Expanded(
                        flex: 14,
                        child: ListTile(
                            leading: IconButton(
                                icon: Icon(
                                  Icons.location_on,
                                  color: Colors.blueGrey,
                                  size: 25.0,
                                ),
                                onPressed: null),
                            title: TextField(
                              controller: messageController,
                              keyboardType: TextInputType.text,
                              maxLines: 4,
                              minLines: 1,
                              decoration: InputDecoration(
                                hintText: 'Type Message..',
                                hintStyle: TextStyle(
                                    color: Colors.grey[600], fontSize: 18.0),
                              ),
                            ),
                            trailing: IconButton(
                                icon: Icon(
                                  Icons.forward,
                                  color: Colors.greenAccent,
                                  size: 30.0,
                                ),
                                onPressed: () {
                                  messages.add(
                                      Message(msg: messageController.text));
                                  messageController.clear();
                                })),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
