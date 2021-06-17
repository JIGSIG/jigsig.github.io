import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digital_project_manager/digital_project_manager.dart';

void main() {
  const MethodChannel channel = MethodChannel('digital_project_manager');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await DigitalProjectManager.platformVersion, '42');
  });
}
