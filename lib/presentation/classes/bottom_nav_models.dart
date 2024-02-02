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
