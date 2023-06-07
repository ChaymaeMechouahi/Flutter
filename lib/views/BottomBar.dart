import 'package:flutter/material.dart';

import '../controllers/move.dart';

class MyBottomAppBar extends StatelessWidget {
  final Function(BuildContext) onHomePressed;
  final Function(BuildContext) onAwardsPressed;

  MyBottomAppBar({required this.onHomePressed, required this.onAwardsPressed});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color.fromARGB(255, 173, 173, 173),
      child: Container(
        height: 60,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.brown[200],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.brown[200],
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              retourPagePrincipale(context);
                            },
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.brown[200],
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              onHomePressed(context);
                            },
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.brown[200],
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.emoji_events,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              onAwardsPressed(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
