import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card',
      debugShowCheckedModeBanner: false,
      home: ProfileCard(),
    );
  }
}

class ProfileCard extends StatefulWidget {
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  int likeCount = 0;

  // Increment likes
  void incrementLikes() {
    setState(() {
      likeCount++;
    });
  }

  // Dynamic background color based on likes
  Color getCardColor() {
    if (likeCount >= 15) {
      return Colors.pink[100]!;
    } else if (likeCount >= 8) {
      return Colors.purple[100]!;
    } else {
      return Colors.blue[50]!;
    }
  }

  // Dynamic message based on likes
  String getMessage() {
    if (likeCount >= 15)
      return 'Superstar!';
    else if (likeCount >= 8)
      return 'You are popular!';
    else if (likeCount >= 3)
      return 'Getting noticed!';
    else
      return 'Hello there!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: getCardColor(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Avatar
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.teal,
                child: Text(
                  'FM', // Your initials
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Name
              Text(
                'Fidelite Munezero', // Your name
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Bio
              Text(
                'Flutter Developer in Training', // Your bio
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 15),
              // Dynamic message
              Text(
                getMessage(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.teal[700],
                ),
              ),
              SizedBox(height: 30),
              // Like counter row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite, color: Colors.red, size: 30),
                  SizedBox(width: 10),
                  Text(
                    '$likeCount',
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Like button
              ElevatedButton.icon(
                onPressed: incrementLikes,
                icon: Icon(Icons.thumb_up),
                label: Text('Like'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}