import 'package:flutter/material.dart';

///RETORNA ANCHO RESPONSIVO
double sw(double d, BuildContext context) {
  final s = MediaQuery.of(context).size;
  final h = s.height * d;
  final w = s.width * d;  
  return h > w ? w : h;
}


///RETORNA ALTO RESPONSIVO
double sh(double d, BuildContext context) {
  final s = MediaQuery.of(context).size;
  final h = s.height * d;
  final w = s.width * d;  
  return h > w ? h : w;
}