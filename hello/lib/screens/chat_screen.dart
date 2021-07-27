import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hello/constants.dart';
import 'package:hello/screens/login_screen.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final messageTextController = TextEditingController();
  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = await _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app_rounded),
            onPressed: () {
              _auth.signOut();
              Navigator.popAndPushNamed(context, LoginScreen.id);
            },
          ),
        ],
        title: Text('Abhishek'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MessageBuilder(),
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: TextField(
                    controller: messageTextController,
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      messageText = value;
                    },
                    decoration: kMessageTextField.copyWith(
                      hintText: 'Type Something here',
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.blueGrey[700],
                  onPressed: () {
                    messageTextController.clear();
                    _firestore.collection('messages').add({
                      'text': messageText,
                      'sender': loggedInUser.email,
                      'date': DateTime.now().toIso8601String().toString(),
                    });
                  },
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBuilder extends StatefulWidget {
  @override
  _MessageBuilderState createState() => _MessageBuilderState();
}

class _MessageBuilderState extends State<MessageBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('date').snapshots(),
      builder: (contect, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueAccent,
            ),
          );
        }
        final messages = snapshot.data.docs.reversed;
        List<MessageBubbles> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.get('text');
          final messageSender = message.get('sender');
          final currentUser = loggedInUser.email;
          final messageBubble = MessageBubbles(
            text: messageText,
            sender: messageSender,
            isMe: currentUser == messageSender,
          );
          messageBubbles.add(messageBubble);
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubbles extends StatelessWidget {
  MessageBubbles({this.text, this.sender, this.isMe});
  final text;
  final sender;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            '$sender',
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.white54,
            ),
          ),
          Material(
            elevation: 5.0,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
            color: isMe ? Colors.blueGrey[400] : Colors.grey[900],
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Text(
                '$text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
