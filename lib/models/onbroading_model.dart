// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quick_bite/gen/assets.gen.dart';

class OnbroadingModel {
  String? image;
  String? title1;
  String? title2;
  String? subTitle;
  String? textButton;
  OnbroadingModel();
}

List<OnbroadingModel> listonbroading = [
  OnbroadingModel()
    ..image = Assets.images.on1.path
    ..title1 = 'Satisfy your cravings\nwith'
    ..title2 = ' ease'
    ..subTitle = 'Integer a viverra sit feugiat leo\ncommodo nunc.'
    ..textButton = 'NEXT',
  OnbroadingModel()
    ..image = Assets.images.on2.path
    ..title1 = 'Find your new favorite\nrestaurant with'
    ..title2 = ' just a tap'
    ..subTitle = 'Integer a viverra sit feugiat leo\ncommodo nunc.'
    ..textButton = 'NEXT',
  OnbroadingModel()
    ..image = Assets.images.on3.path
    ..title1 = 'Fresh meals, delivered to\nyour'
    ..title2 = ' doorstep'
    ..subTitle = ' Integer a viverra sit feugiat leo\ncommodo nunc.'
    ..textButton = 'GET STARTED',
];
