import 'package:booking_app/gen/assets.gen.dart';

class HomeRepository {
  Future<List<String>> fetchPromos() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Assets.images.poster.path,
      Assets.images.poster.path,
      Assets.images.poster.path,
    ];
  }

  Future<List<String>> fetchEvents() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Assets.images.poster.path,
      Assets.images.poster.path,
      Assets.images.poster.path,
      Assets.images.poster.path,
      Assets.images.poster.path,
      Assets.images.poster.path,
    ];
  }
}
