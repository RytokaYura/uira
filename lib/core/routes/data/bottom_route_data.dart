import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BottomRouteData {
  final List<BottomNavigationBarItem> barItems = [
    BottomNavigationBarItem(
      icon: Icon(PhosphorIcons.house(PhosphorIconsStyle.regular)),
      activeIcon: Icon(PhosphorIcons.house(PhosphorIconsStyle.fill)),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(PhosphorIcons.musicNotes(PhosphorIconsStyle.regular)),
      activeIcon: Icon(PhosphorIcons.musicNotes(PhosphorIconsStyle.fill)),
      label: 'Music',
    ),
    BottomNavigationBarItem(
      icon: Icon(PhosphorIcons.video(PhosphorIconsStyle.regular)),
      activeIcon: Icon(PhosphorIcons.video(PhosphorIconsStyle.fill)),
      label: 'Video',
    ),
    BottomNavigationBarItem(
      icon: Icon(PhosphorIcons.gear(PhosphorIconsStyle.regular)),
      activeIcon: Icon(PhosphorIcons.gear(PhosphorIconsStyle.fill)),
      label: 'Setting',
    ),
  ];
}