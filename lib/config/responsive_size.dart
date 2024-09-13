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

///RETORNA SI HAY UN NOTCH MAYOR A 35 px
double nh(BuildContext context) {
  final n = MediaQuery.of(context).viewPadding.top;
  final exacto = 32.5 - n;
  return n + exacto;
}