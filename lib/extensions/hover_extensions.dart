import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:app/ui/widgets/translate_on_hover.dart';

extension HoverExtensions on Widget {
  //in the index.html set the "<body id="app-container">". That way the this varialbe will contain the whole body
  static final appContainer =
      html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return MouseRegion(
      child: this, // the widget we're using the extension on
      onHover: (event) => appContainer.style.cursor = 'pointer',
      onExit: (event) => appContainer.style.cursor = 'default',
    );
  }

  Widget get moveUpOnHover {
    return TranslateOnHover(
      child: this,
    );
  }
}
