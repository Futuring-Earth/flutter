/*
*  onboarding1_widget.dart
*  20200514_Futuring_Concept_LA
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:app/ui/views/sketch/onboarding/onboarding2_view.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/on_boarding_view_style.dart';
import 'package:app/styles/onboarding_button_style.dart';
import 'package:app/values/values.dart';

class Onboarding1Widget extends StatelessWidget {
  static const routeName = '/onboarding_setp1';

  void onMainCTAPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => Onboarding2View()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Onboardingviewstyle(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                left: -80,
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
                            right: 6214,
                            bottom: 3462,
                            child: Image.asset(
                              "assets/images/futuring-illustration-futuring-17.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 912,
                            right: 6364,
                            child: OnboardingbuttonstyleButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () => this.onMainCTAPressed(context),
                              child: Text(
                                "Los geht’s",
                                textAlign: TextAlign.left,
                                style: TextStyle(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 99,
                      top: 625,
                      right: 6256,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Willkommen bei Futuring! \n",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.secondaryText,
                              fontFamily: "",
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              height: 1.2,
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 36, top: 67, right: 36),
                            child: Text(
                              "Wie dürfen wir dich nennen?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 1,
                              height: 20,
                              margin: EdgeInsets.only(top: 40, right: 135),
                              decoration: BoxDecoration(
                                color: AppColors.primaryElement,
                              ),
                              child: Container(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 167,
                              height: 1,
                              margin: EdgeInsets.only(top: 7, right: 76),
                              decoration: BoxDecoration(
                                color: AppColors.primaryElement,
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
              Positioned(
                width: 200,
                top: 270,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Thea",
                    contentPadding: EdgeInsets.all(0),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontFamily: "",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  maxLines: 1,
                  autocorrect: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
