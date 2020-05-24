/*
*  homeview.dart
*  futuring
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:app/values/values.dart';

class Homeview extends StatelessWidget {
  void onFolgenPressed(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 800,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              left: -1,
              top: 0,
              right: -297,
              bottom: -210,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 445,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 1,
                          top: 1,
                          right: 50,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 0,
                                top: 55,
                                right: 0,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          height: 390,
                                          margin: EdgeInsets.only(right: 64),
                                          child: Image.asset(
                                            "assets/images/rectangle-8.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 181,
                                        height: 234,
                                        margin: EdgeInsets.only(top: 142),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                width: 181,
                                                height: 181,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(
                                                          193, 33, 140, 83),
                                                      offset: Offset(0, 2),
                                                      blurRadius: 41,
                                                    ),
                                                  ],
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Container(
                                                      height: 181,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Positioned(
                                                            child: Container(
                                                              width: 128,
                                                              height: 128,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  width: 21.96,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          112,
                                                                          245,
                                                                          174),
                                                                ),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            63.8912)),
                                                              ),
                                                              child:
                                                                  Container(),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            child: Container(
                                                              width: 128,
                                                              height: 128,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  width: 21.96,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          229,
                                                                          214,
                                                                          43),
                                                                ),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            63.97208)),
                                                              ),
                                                              child:
                                                                  Container(),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            left: 4,
                                                            right: 4,
                                                            child: Image.asset(
                                                              "assets/images/oval-3.png",
                                                              fit: BoxFit.none,
                                                            ),
                                                          ),
                                                          Positioned(
                                                            child: Image.asset(
                                                              "assets/images/oval-12.png",
                                                              fit: BoxFit.none,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                width: 66,
                                                height: 39,
                                                margin: EdgeInsets.only(
                                                    top: 14, right: 113),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Container(
                                                        width: 2,
                                                        height: 34,
                                                        margin: EdgeInsets.only(
                                                            top: 2, right: 6),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255,
                                                              229,
                                                              213,
                                                              42),
                                                        ),
                                                        child: Container(),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        "45% \nHaushalt",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .secondaryText,
                                                          fontFamily: "",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 19.2,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 2,
                                top: 0,
                                right: 246,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      height: 60,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Positioned(
                                            left: 0,
                                            right: 0,
                                            child: Container(
                                              height: 56,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromARGB(
                                                        25, 0, 0, 0),
                                                    offset: Offset(0, 4),
                                                    blurRadius: 5,
                                                  ),
                                                ],
                                              ),
                                              child: Image.asset(
                                                "assets/images/combined-shape-2.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 19,
                                            right: 23,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(
                                                    width: 81,
                                                    height: 57,
                                                    child: Image.asset(
                                                      "assets/images/group-2.png",
                                                      fit: BoxFit.none,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(
                                                    width: 26,
                                                    height: 26,
                                                    margin: EdgeInsets.only(
                                                        left: 34),
                                                    child: Image.asset(
                                                      "assets/images/home-24px-2.png",
                                                      fit: BoxFit.none,
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(
                                                    width: 22,
                                                    height: 22,
                                                    margin: EdgeInsets.only(
                                                        right: 45),
                                                    child: Image.asset(
                                                      "assets/images/explore-24px-2.png",
                                                      fit: BoxFit.none,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(
                                                    width: 22,
                                                    height: 22,
                                                    margin: EdgeInsets.only(
                                                        right: 31),
                                                    child: Image.asset(
                                                      "assets/images/chat-bubble-24px.png",
                                                      fit: BoxFit.none,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    child: Image.asset(
                                                      "assets/images/oval-16.png",
                                                      fit: BoxFit.none,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(left: 22, top: 27),
                                        child: Text(
                                          "Dein Impact",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 31, 53, 84),
                                            fontFamily: "Rubik",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 22,
                                        height: 38,
                                        margin:
                                            EdgeInsets.only(left: 44, top: 35),
                                        child: Image.asset(
                                          "assets/images/group-12-7.png",
                                          fit: BoxFit.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 243,
                                right: 47,
                                child: Container(
                                  width: 88,
                                  height: 88,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryBackground,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(44)),
                                  ),
                                  child: Container(),
                                ),
                              ),
                              Positioned(
                                left: 24,
                                top: 162,
                                right: 76,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(left: 57),
                                        child: Text(
                                          "Fußabdruck verkleinern",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 30, 53, 84),
                                            fontFamily: "",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 276,
                                        height: 60,
                                        margin:
                                            EdgeInsets.only(left: 20, top: 32),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Container(
                                              width: 116,
                                              margin: EdgeInsets.only(top: 1),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      width: 68,
                                                      height: 20,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Positioned(
                                                            left: 0,
                                                            top: 0,
                                                            child: Text(
                                                              "45 kg CO ",
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        30,
                                                                        53,
                                                                        84),
                                                                fontFamily: "",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            left: 62,
                                                            top: 8,
                                                            child: Text(
                                                              "2",
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        30,
                                                                        53,
                                                                        84),
                                                                fontFamily: "",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      width: 116,
                                                      height: 14,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            child: Container(
                                                              width: 9,
                                                              height: 9,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          3),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        46,
                                                                        194,
                                                                        115),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            4.5)),
                                                              ),
                                                              child:
                                                                  Container(),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 4),
                                                              child: Text(
                                                                "Bereits eingespart",
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          30,
                                                                          53,
                                                                          84),
                                                                  fontFamily:
                                                                      "",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 81,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 80,
                                                      height: 20,
                                                      margin: EdgeInsets.only(
                                                          right: 1),
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Positioned(
                                                            top: 0,
                                                            right: 3,
                                                            child: Text(
                                                              "1 Tonne CO ",
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        30,
                                                                        53,
                                                                        84),
                                                                fontFamily: "",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 8,
                                                            right: 0,
                                                            child: Text(
                                                              "2",
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        30,
                                                                        53,
                                                                        84),
                                                                fontFamily:
                                                                    "Rubik",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 61,
                                                      height: 14,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            child: Container(
                                                              width: 9,
                                                              height: 9,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right: 4,
                                                                      bottom:
                                                                          3),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        236,
                                                                        242,
                                                                        235),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            4.5)),
                                                              ),
                                                              child:
                                                                  Container(),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            child: Container(
                                                              width: 48,
                                                              child: Text(
                                                                "Dein Ziel",
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          30,
                                                                          53,
                                                                          84),
                                                                  fontFamily:
                                                                      "",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        width: 523,
                                        height: 143,
                                        margin: EdgeInsets.only(top: 7),
                                        child: Stack(
                                          alignment: Alignment.topCenter,
                                          children: [
                                            Positioned(
                                              top: 9,
                                              child: Container(
                                                width: 331,
                                                height: 134,
                                                decoration: BoxDecoration(
                                                  color: AppColors
                                                      .ternaryBackground,
                                                ),
                                                child: Container(),
                                              ),
                                            ),
                                            Positioned(
                                              top: 38,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Text(
                                                      "45% \nHaushalt",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 30, 53, 84),
                                                        fontFamily: "",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13.44,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Container(
                                                      width: 45,
                                                      margin: EdgeInsets.only(
                                                          top: 17),
                                                      child: Text(
                                                        "25%\nTransport",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 30, 53, 84),
                                                          fontFamily: "",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13.44,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              left: 16,
                                              top: 0,
                                              right: 0,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Container(
                                                        height: 86,
                                                        margin: EdgeInsets.only(
                                                            right: 32),
                                                        child: Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            Positioned(
                                                              left: 11,
                                                              right: 11,
                                                              child: Container(
                                                                height: 64,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    width:
                                                                        15.98,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            112,
                                                                            245,
                                                                            174),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              31.9456)),
                                                                ),
                                                                child:
                                                                    Container(),
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 11,
                                                              right: 11,
                                                              child: Container(
                                                                height: 64,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    width:
                                                                        15.98,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            229,
                                                                            214,
                                                                            43),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              31.98604)),
                                                                ),
                                                                child:
                                                                    Container(),
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 0,
                                                              right: 0,
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/oval-8.png",
                                                                fit:
                                                                    BoxFit.none,
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 15,
                                                              right: 15,
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/oval-22.png",
                                                                fit:
                                                                    BoxFit.none,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      width: 2,
                                                      height: 71,
                                                      margin: EdgeInsets.only(
                                                          left: 32, top: 39),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Container(
                                                              width: 2,
                                                              height: 26,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        229,
                                                                        213,
                                                                        42),
                                                              ),
                                                              child:
                                                                  Container(),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Container(
                                                              width: 2,
                                                              height: 26,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 19),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        207,
                                                                        234,
                                                                        203),
                                                              ),
                                                              child:
                                                                  Container(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      width: 3,
                                                      height: 72,
                                                      margin: EdgeInsets.only(
                                                          top: 39, right: 6),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Container(
                                                              width: 2,
                                                              height: 26,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right: 1),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        50,
                                                                        120,
                                                                        82),
                                                              ),
                                                              child:
                                                                  Container(),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Container(
                                                              width: 2,
                                                              height: 27,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 19),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        111,
                                                                        245,
                                                                        174),
                                                              ),
                                                              child:
                                                                  Container(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      width: 50,
                                                      height: 73,
                                                      margin: EdgeInsets.only(
                                                          top: 38, right: 199),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Text(
                                                              "25% \nErnährung",
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        30,
                                                                        53,
                                                                        84),
                                                                fontFamily: "",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 13.44,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 17,
                                                                      right:
                                                                          11),
                                                              child: Text(
                                                                "5% \nKonsum",
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style:
                                                                    TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          30,
                                                                          53,
                                                                          84),
                                                                  fontFamily:
                                                                      "",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      13.44,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      width: 29,
                                                      height: 48,
                                                      child: Image.asset(
                                                        "assets/images/group-12.png",
                                                        fit: BoxFit.none,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 38,
                                top: 313,
                                child: Container(),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 174,
                          right: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "Bereiche Deiner CO2 Einsparung ",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.secondaryText,
                                    fontFamily: "",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 76,
                                  height: 39,
                                  margin: EdgeInsets.only(top: 195, right: 41),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: 2,
                                          height: 34,
                                          margin:
                                              EdgeInsets.only(top: 2, right: 7),
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 50, 120, 82),
                                          ),
                                          child: Container(),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "25% \nErnährung",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: AppColors.secondaryText,
                                            fontFamily: "",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 19.2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(left: 27, top: 7, right: 55),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Text(
                              "Was gibt es Neues?",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "",
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                height: 1.8125,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 2,
                            height: 34,
                            margin: EdgeInsets.only(top: 2, right: 7),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 207, 234, 203),
                            ),
                            child: Container(),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(right: 41),
                            child: Text(
                              "25%\nTransport",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "",
                                fontWeight: FontWeight.w500,
                                fontSize: 19.2,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 2,
                            height: 35,
                            margin: EdgeInsets.only(top: 5, right: 7),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 111, 245, 174),
                            ),
                            child: Container(),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 1),
                            child: Text(
                              "5% \nKonsum",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "",
                                fontWeight: FontWeight.w500,
                                fontSize: 19.2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 336,
                      height: 57,
                      margin: EdgeInsets.only(right: 313, bottom: 13),
                      decoration: BoxDecoration(
                        color: AppColors.primaryElement,
                        boxShadow: [
                          Shadows.primaryShadow,
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 169,
                            height: 38,
                            margin: EdgeInsets.only(left: 12),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: 0,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 37,
                                        height: 39,
                                        child: Image.asset(
                                          "assets/images/oval-18.png",
                                          fit: BoxFit.none,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        margin: EdgeInsets.only(right: 9),
                                        child: Text(
                                          "Thea",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: AppColors.primaryText,
                                            fontFamily: "",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 82,
                                  child: Text(
                                    "folgt dir jetzt.",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontFamily: "",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 46,
                            height: 17,
                            margin: EdgeInsets.only(right: 20),
                            child: FlatButton(
                              onPressed: () => this.onFolgenPressed(context),
                              color: Color.fromARGB(0, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                              ),
                              textColor: Color.fromARGB(255, 35, 53, 83),
                              padding: EdgeInsets.all(0),
                              child: Text(
                                "Folgen",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 336,
                      height: 285,
                      margin: EdgeInsets.only(right: 313),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 285,
                              decoration: BoxDecoration(
                                color: AppColors.primaryBackground,
                                boxShadow: [
                                  Shadows.primaryShadow,
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Container(),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 12,
                            right: -1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height: 44,
                                  margin: EdgeInsets.only(left: 11, right: 6),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 37,
                                        height: 39,
                                        child: Image.asset(
                                          "assets/images/oval-4.png",
                                          fit: BoxFit.none,
                                        ),
                                      ),
                                      Spacer(),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          margin: EdgeInsets.only(right: 25),
                                          child: Text(
                                            "Max hat ein neues Bild in eure \nBastel eine Maske Challenge gepostet.",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontFamily: "",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 224,
                                  margin: EdgeInsets.only(top: 7),
                                  child: Image.asset(
                                    "assets/images/julian-wan-dwac44fuv5o-unsplash.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 123,
              child: Container(
                width: 331,
                height: 304,
                decoration: BoxDecoration(
                  color: AppColors.primaryBackground,
                  boxShadow: [
                    Shadows.primaryShadow,
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
