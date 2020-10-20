import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

void initializeTimeConfig() {
  initializeTimeZones();

  setLocalLocation(getLocation('America/Chicago'));
}
