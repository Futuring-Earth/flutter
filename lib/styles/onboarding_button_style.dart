/*
*  onboarding_button_style.dart
*  futuring
*
*  Created by Eric Pomeranz.
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';


// Style Background Color
const Color _backgroundColor = Color.fromARGB(255, 235, 237, 231);

// Style Border
const BorderSide _borderSide = BorderSide(
  color: Color.fromARGB(255, 151, 151, 151),
  width: 1,
  style: BorderStyle.solid,
);

// Style Corner Radius
const BorderRadiusGeometry _cornerRadius = BorderRadius.all(Radius.circular(3));

// Style Foreground Color
const Color _foregroundColor = Color.fromARGB(255, 30, 53, 87);

// Style Font
const double _fontSize = 16;
const FontWeight _fontWeight = FontWeight.w400;
const String _fontFamily = "";
const FontStyle _fontStyle = null;


class OnboardingbuttonstyleDecoration extends BoxDecoration {
  const OnboardingbuttonstyleDecoration({
    Color color = _backgroundColor,
    Gradient gradient,
    Border border = const Border.fromBorderSide(_borderSide),
    BorderRadiusGeometry borderRadius = _cornerRadius,
    List<BoxShadow> boxShadow,
  }) : super(
         color: color,
         border: border,
         borderRadius: borderRadius,
         boxShadow: boxShadow,
         gradient: gradient,
       );
  
  OnboardingbuttonstyleDecoration.withOverrides({
    Color color = _backgroundColor,
    Gradient gradient,
    double borderWidth,
    Color borderColor,
    BorderRadiusGeometry borderRadius = _cornerRadius,
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


class OnboardingbuttonstyleTextStyle extends TextStyle {
  const OnboardingbuttonstyleTextStyle({
    Color color = _foregroundColor,
    double fontSize = _fontSize,
    FontWeight fontWeight = _fontWeight,
    String fontFamily = _fontFamily,
    FontStyle fontStyle = _fontStyle,
    double height,
    double letterSpacing,
  }) : super(
         color: color,
         fontSize: fontSize,
         fontWeight: fontWeight,
         fontFamily: fontFamily,
       );
}


class Onboardingbuttonstyle extends StatelessWidget {
  const Onboardingbuttonstyle({
    Key key,
    this.decoration = const OnboardingbuttonstyleDecoration(),
    this.child,
  }) : super(key: key);
  final OnboardingbuttonstyleDecoration decoration;
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
  
    return DefaultTextStyle(
      style: const OnboardingbuttonstyleTextStyle(),
      child: DecoratedBox(
        decoration: this.decoration,
        child: this.child,
      ),
    );
  }
}


class OnboardingbuttonstyleButton extends StatelessWidget {
  
  const OnboardingbuttonstyleButton({
    Key key,
    this.color = _backgroundColor,
    this.border = _borderSide,
    this.borderRadius = _cornerRadius,
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
      child: DefaultTextStyle(
        style: const OnboardingbuttonstyleTextStyle(),
        child: this.child,
      ),
    );
  }
}


class OnboardingbuttonstyleSwitch extends StatelessWidget {
  const OnboardingbuttonstyleSwitch({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.activeColor = _foregroundColor,
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


class OnboardingbuttonstyleSlider extends StatelessWidget {
  const OnboardingbuttonstyleSlider({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.inactiveColor = _backgroundColor,
    this.activeColor = _foregroundColor,
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


class OnboardingbuttonstyleCircularProgressIndicator extends StatelessWidget {
  const OnboardingbuttonstyleCircularProgressIndicator({
    Key key,
    this.color = _foregroundColor,
  }): super(key: key);
  final Color color;
  
  @override
  Widget build(BuildContext context) {
  
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(this.color),
    );
  }
}


class OnboardingbuttonstyleLinearProgressIndicator extends StatelessWidget {
  const OnboardingbuttonstyleLinearProgressIndicator({
    Key key,
    this.color = _foregroundColor,
  }): super(key: key);
  final Color color;
  
  @override
  Widget build(BuildContext context) {
  
    return LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(this.color),
    );
  }
}