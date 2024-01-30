import 'package:rive/rive.dart';

class NavItemModel {
  final String title;
  final RiveModel rive;
  late SMIBool status;
  NavItemModel({required this.title, required this.rive});
}

class RiveModel {
  final String src;
  final String artboard;
  final String stateMachineName;

  RiveModel(
      {required this.src,
      required this.artboard,
      required this.stateMachineName});
}

List<NavItemModel> bottomNavItems = [
  NavItemModel(
    title: "home",
    rive: RiveModel(
      src: "assets/animations/bottom_nav_items.riv",
      artboard: "home",
      stateMachineName: 'home_state',
    ),
  ),
  NavItemModel(
      title: "heart",
      rive: RiveModel(
          src: "assets/animations/bottom_nav_items.riv",
          artboard: "heart",
          stateMachineName: "heart_state")),
  NavItemModel(
    title: "ai_generate",
    rive: RiveModel(
      src: "assets/animations/bottom_nav_items.riv",
      artboard: "ai_gen",
      stateMachineName: "ai_gen_state",
    ),
  ),
  NavItemModel(
    title: "spectacles",
    rive: RiveModel(
      src: "assets/animations/bottom_nav_items.riv",
      artboard: "spectacles",
      stateMachineName: "spectacle_state",
    ),
  ),
  NavItemModel(
    title: "profile",
    rive: RiveModel(
      src: "assets/animations/bottom_nav_items.riv",
      artboard: "profile",
      stateMachineName: "profile_state",
    ),
  ),
];
