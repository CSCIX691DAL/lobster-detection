import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("HomeScreen Widget Test", () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll() async {
      if (driver != null) await driver.close();
    }

    //TESTS
    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });
  });
}
