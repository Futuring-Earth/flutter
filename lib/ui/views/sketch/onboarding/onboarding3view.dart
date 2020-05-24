/*
*  onboarding3view.dart
*  futuring
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:app/styles/style.dart';
import 'package:app/values/values.dart';

class Onboarding3view extends StatelessWidget {
  void onStatesPressed(BuildContext context) {}

  void onStatesTwoPressed(BuildContext context) {}

  void onStatesThreePressed(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 33, 53, 85),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              left: -30,
              top: -554,
              right: -6235,
              bottom: -3518,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 837,
                          right: 6064,
                          child: Image.asset(
                            "assets/images/group-12.png",
                            fit: BoxFit.none,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Image.asset(
                            "assets/images/futuring-illustration-futuring-18.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 632,
                          right: 5976,
                          bottom: 3493,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 44, right: 273),
                                child: Text(
                                  "Weißt du schon wofür der Fuß- und Handabdruck stehen?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.secondaryText,
                                    fontFamily: "",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                    height: 1.36,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 144,
                                child: Image.asset(
                                  "assets/images/path-3.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 6224,
                          bottom: 3494,
                          child: Image.asset(
                            "assets/images/futuring-illustration-hand-and-foot.png",
                            fit: BoxFit.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 39,
                    top: 565,
                    right: 6254,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 1),
                            child: Text(
                              "1/5",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 3,
                          margin: EdgeInsets.only(top: 3),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                right: 0,
                                child: Style(
                                  child: StyleLinearProgressIndicator(),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 13,
                                  height: 3,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 0, 200, 107),
                                  ),
                                  child: Container(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 217,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 178,
                      height: 46,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned(
                            top: 4,
                            child: Image.asset(
                              "assets/images/-elevation-5.png",
                              fit: BoxFit.none,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: FlatButton(
                              onPressed: () => this.onStatesPressed(context),
                              color: Color.fromARGB(0, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                              ),
                              textColor: Color.fromARGB(255, 0, 0, 0),
                              padding: EdgeInsets.all(0),
                              child: Text(
                                "",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 9,
                            child: Text(
                              "na klar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 30, 57, 81),
                                fontFamily: "",
                                fontWeight: FontWeight.w400,
                                fontSize: 18.2,
                                letterSpacing: 0.325,
                                height: 1.42857,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 177,
                      height: 42,
                      margin: EdgeInsets.only(top: 23),
                      child: Image.asset(
                        "assets/images/-elevation-5.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 177,
                      height: 42,
                      margin: EdgeInsets.only(top: 22),
                      child: Image.asset(
                        "assets/images/-elevation-5.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 286,
              child: FlatButton(
                onPressed: () => this.onStatesTwoPressed(context),
                color: Color.fromARGB(0, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                textColor: Color.fromARGB(255, 0, 0, 0),
                padding: EdgeInsets.all(0),
                child: Text(
                  "",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 291,
              child: Text(
                "nee",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 30, 57, 81),
                  fontFamily: "",
                  fontWeight: FontWeight.w400,
                  fontSize: 18.2,
                  letterSpacing: 0.325,
                  height: 1.42857,
                ),
              ),
            ),
            Positioned(
              top: 350,
              child: FlatButton(
                onPressed: () => this.onStatesThreePressed(context),
                color: Color.fromARGB(0, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                textColor: Color.fromARGB(255, 0, 0, 0),
                padding: EdgeInsets.all(0),
                child: Text(
                  "",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 355,
              child: Text(
                "so ungefähr",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 30, 57, 81),
                  fontFamily: "",
                  fontWeight: FontWeight.w400,
                  fontSize: 18.2,
                  letterSpacing: 0.325,
                  height: 1.42857,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
