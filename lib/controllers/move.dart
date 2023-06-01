// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
void retourPagePrincipale(BuildContext context) {
  Navigator.pop(context);
}
void scrollToSection(BuildContext context, GlobalKey key) {
  final RenderObject? renderObject = key.currentContext?.findRenderObject();
  if (renderObject is RenderBox) {
    final position = renderObject.localToGlobal(Offset.zero);
    Scrollable.ensureVisible(
      key.currentContext!,
      alignment: 0.0, 
      duration: Duration(milliseconds: 500), 
    );
  }
}
void navigateToPage(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}