import 'package:cursed_chipotle/pages/Map_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(color: Colors.black87),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      "Burrito Finder",
                      style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SvgPicture.asset(
                      "images/burrito.svg",
                      color: Colors.white,
                    ),
                    Text(
                      "Find a Chipotle Near You",
                      style: TextStyle(color: Colors.white54),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapScreen()))
                      },
                  child: Text("FEED ME"))
            ],
          ),
        ),
      ),
    );
  }
}
