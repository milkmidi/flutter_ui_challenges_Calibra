import 'package:flutter/material.dart';

const _colors = [
  0xff1abc9c,
  0xff2ecc71,
  0xff3498db,
  0xff9b59b6,
  0xff34495e,
  0xfff1c40f
];

Color getColor(int index){
  return Color(_colors[index % _colors.length]);
}