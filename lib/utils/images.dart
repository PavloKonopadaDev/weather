import 'package:flutter/material.dart';

class ThemeImages {
  static final String path = "assets/images/";

  static final String catRes = "cat.png";
  static AssetImage get cat => AssetImage("$path$catRes");
}
