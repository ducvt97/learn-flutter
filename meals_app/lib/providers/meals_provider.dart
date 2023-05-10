import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/dummy_data.dart';

final mealsProvider = Provider((ref) => DUMMY_MEALS);
