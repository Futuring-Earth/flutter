/*
*  onboarding2_view_widget.dart
*  20200514_Futuring_Concept_LA
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:app/ui/views/sketch/onboarding/onboarding3view.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/onboarding_button_style.dart';
import 'package:app/values/values.dart';

class Onboarding2View extends StatelessWidget {
  void onMainCTAPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => Onboarding3view()));

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
              left: -240,
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
                          right: 6186,
                          bottom: 3493,
                          child: Image.asset(
                            "assets/images/path-3-2.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 271,
                          bottom: 3517,
                          child: Image.asset(
                            "assets/images/futuring-illustration-futuring-24.png",
                            fit: BoxFit.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 249,
                    top: 565,
                    right: 6254,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "0/5",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.secondaryText,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Container(
                          height: 3,
                          margin: EdgeInsets.only(top: 3),
                          child: LinearProgressIndicator(
                            backgroundColor: Color.fromARGB(255, 184, 184, 184),
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                Color.fromARGB(255, 0, 128, 255)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 289,
                            margin: EdgeInsets.only(left: 28, top: 40),
                            child: Text(
                              "Glückwunsch Thea!\n\nDeine Futuring Reise beginnt jetzt. \n\nIn 5 kleinen Schritten finden wir heraus welche Challanges zu dir passen…",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "",
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 358,
              child: OnboardingbuttonstyleButton(
                padding: EdgeInsets.all(0),
                onPressed: () => this.onMainCTAPressed(context),
                child: Text(
                  "Challange accepted",
                  textAlign: TextAlign.left,
                  style: TextStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
