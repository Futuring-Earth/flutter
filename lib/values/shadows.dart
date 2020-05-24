/*
*  shadows.dart
*  futuring
*
*  Created by Eric Pomeranz.
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/rendering.dart';


class Shadows {
  static const BoxShadow primaryShadow = BoxShadow(
    color: Color.fromARGB(51, 0, 0, 0),
    offset: Offset(0, 1),
    blurRadius: 3,
  );
  static const BoxShadow secondaryShadow = BoxShadow(
    color: Color.fromARGB(73, 142, 142, 142),
    offset: Offset(0, 2),
    blurRadius: 14,
  );
}