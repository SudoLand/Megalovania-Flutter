import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

Future<void> initializeTimeConfig() async {
  initializeTimeZones();

  setLocalLocation(getLocation('America/Chicago'));
}
