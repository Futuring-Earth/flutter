/*
*  style.dart
*  20200514_Futuring_Concept_LA
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';


// Style Border
const BorderSide _borderSide = BorderSide(
  color: Color.fromARGB(255, 151, 151, 151),
  width: 1,
  style: BorderStyle.solid,
);


class StyleDecoration extends BoxDecoration {
  const StyleDecoration({
    Color color,
    Gradient gradient,
    Border border = const Border.fromBorderSide(_borderSide),
    BorderRadiusGeometry borderRadius,
    List<BoxShadow> boxShadow,
  }) : super(
         color: color,
         border: border,
         borderRadius: borderRadius,
         boxShadow: boxShadow,
         gradient: gradient,
       );
  
  StyleDecoration.withOverrides({
    Color color,
    Gradient gradient,
    double borderWidth,
    Color borderColor,
    BorderRadiusGeometry borderRadius,
    Color shadowColor,
    Offset shadowOffset,
    double shadowRadius,
  }) : super(
         color: color,
         borderRadius: borderRadius,
         gradient: gradient,
         border: Border.fromBorderSide(_borderSide.copyWith(width: borderWidth, color: borderColor)),
         boxShadow: [ BoxShadow(color: shadowColor ?? const Color(0x00000000), offset: shadowOffset ?? Offset.zero, blurRadius: shadowRadius ?? 0.0) ]
       );
}


class Style extends StatelessWidget {
  const Style({
    Key key,
    this.decoration = const StyleDecoration(),
    this.child,
  }) : super(key: key);
  final StyleDecoration decoration;
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
  
    return DecoratedBox(
      decoration: this.decoration,
      child: this.child,
    );
  }
}


class StyleButton extends StatelessWidget {
  
  const StyleButton({
    Key key,
    this.color,
    this.border = _borderSide,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
    this.padding,
    @required this.onPressed,
    @required this.child,
  }): super(key: key);
  
  final Color color;
  final BorderSide border;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsets padding;
  final VoidCallback onPressed;
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
  
    return FlatButton(
      color: this.color,
      shape: RoundedRectangleBorder(
        side: this.border,
        borderRadius: this.borderRadius,
      ),
      onPressed: this.onPressed,
      child: this.child,
    );
  }
}


class StyleSwitch extends StatelessWidget {
  const StyleSwitch({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.activeColor,
  }): super(key: key);
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  
  @override
  Widget build(BuildContext context) {
  
    return Switch.adaptive(
      value: this.value,
      onChanged: this.onChanged,
      activeColor: this.activeColor,
    );
  }
}


class StyleSlider extends StatelessWidget {
  const StyleSlider({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.inactiveColor,
    this.activeColor,
    this.min,
    this.max,
  }): super(key: key);
  final double value;
  final ValueChanged<double> onChanged;
  final Color inactiveColor;
  final Color activeColor;
  final double min;
  final double max;
  
  @override
  Widget build(BuildContext context) {
  
    return Slider(
      value: this.value,
      onChanged: this.onChanged,
      activeColor: this.activeColor,
    );
  }
}


class StyleCircularProgressIndicator extends StatelessWidget {
  const StyleCircularProgressIndicator({
    Key key,
    this.color,
  }): super(key: key);
  final Color color;
  
  @override
  Widget build(BuildContext context) {
  
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(this.color),
    );
  }
}


class StyleLinearProgressIndicator extends StatelessWidget {
  const StyleLinearProgressIndicator({
    Key key,
    this.color,
  }): super(key: key);
  final Color color;
  
  @override
  Widget build(BuildContext context) {
  
    return LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(this.color),
    );
  }
}