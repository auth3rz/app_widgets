import 'package:flutter/material.dart';

class MenuItem{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });
}

final appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.show_chart_sharp,
  ),
  MenuItem(
    title: 'Snackbars y Dialogs',
    subTitle: 'Indicadores en pantalla',
    link: '/snackbars',
    icon: Icons.messenger_rounded,
  ),
  MenuItem(
    title: 'Animated Container',
    subTitle: 'Contenedor animado',
    link: '/animated',
    icon: Icons.move_down_rounded,
  ),
  MenuItem(
    title: 'UI - Controls',
    subTitle: 'Controles de interfaz',
    link: '/ui-controls',
    icon: Icons.display_settings,
  ),
  MenuItem(
    title: 'Intro del app',
    subTitle: 'Introducción de mi app',
    link: '/intro',
    icon: Icons.video_collection,
  ),
  MenuItem(
    title: 'Infinite scroll y pull',
    subTitle: 'Listas infinitas y pull to refresh',
    link: '/scroll',
    icon: Icons.format_line_spacing_outlined,
  ),
  MenuItem(
    title: 'Contador con Riverpod',
    subTitle: 'Contador básico de flutter usando Riverpod Provider',
    link: '/counter',
    icon: Icons.add,
  ),
  MenuItem(
    title: 'Theme Changer Screen',
    subTitle: 'Cambiar color base del theme y el modo oscuro',
    link: '/theme',
    icon: Icons.sunny,
  ),
];