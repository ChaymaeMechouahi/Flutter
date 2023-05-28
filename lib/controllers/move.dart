// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

void scrollToSection(BuildContext context, GlobalKey key) {
  final RenderObject? renderObject = key.currentContext?.findRenderObject();
  if (renderObject is RenderBox) {
    final position = renderObject.localToGlobal(Offset.zero);
    Scrollable.ensureVisible(
      key.currentContext!,
      alignment: 0.0, // Ajustez la valeur d'alignement si nécessaire
      duration: Duration(milliseconds: 500), // Ajustez la durée d'animation si nécessaire
    );
  }
}