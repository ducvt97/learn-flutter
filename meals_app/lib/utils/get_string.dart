import 'package:meals_app/models/meal.dart';

class GetString {
  static String getComplexityString(Complexity complexity) {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.difficult:
        return 'Difficult';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  static String getAffordabilityString(Affordability affordability) {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }
}
