import 'my_media_query.dart';

extension MyMedia on int {
  double get h {
    return this * MyMediaQuery.size.height / 100;
  }

  double get w {
    return this * MyMediaQuery.size.width / 100;
  }

  double get sp {
    return this * MyMediaQuery.devicePixelRatio / 2.5;
  }
}

extension MyMediaDouble on double {
  double get h {
    return this * MyMediaQuery.size.height / 100;
  }

  double get w {
    return this * MyMediaQuery.size.width / 100;
  }

  double get sp {
    return this * MyMediaQuery.devicePixelRatio / 2.5;
  }
}
