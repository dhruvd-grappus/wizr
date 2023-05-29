import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor { dev, qa, prod }

class FlavorValues {
  const FlavorValues({
    required this.apiBaseUrl,
    required this.authBaseUrl,
  });

  final String apiBaseUrl;
  final String authBaseUrl;
}

class FlavorConfig {
  factory FlavorConfig({required Flavor flavor, required FlavorValues values}) {
    _instance ??=
        FlavorConfig._internal(flavor, enumName(flavor.toString()), values);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.values);

  final Flavor? flavor;
  final FlavorValues values;
  final String name;
  static FlavorConfig? _instance;

  // ignore: prefer_constructors_over_static_methods
  static FlavorConfig get instance {
    if (_instance == null) {
      return FlavorConfig(
        flavor: Flavor.dev,
        values: const FlavorValues(apiBaseUrl: '', authBaseUrl: ''),
      );
    }
    return _instance!;
  }

  static bool isProduction() => _instance?.flavor == Flavor.prod;

  static bool isStaging() => _instance?.flavor == Flavor.qa;

  static bool isDevelopment() => _instance?.flavor == Flavor.dev;

  static String enumName(String enumToString) {
    final paths = enumToString.split('.');
    return paths[paths.length - 1];
  }

  static FlavorValues getFlavorValue() {
    return FlavorValues(
      apiBaseUrl: dotenv.env['API_BASE_URL'] ?? '',
      authBaseUrl: dotenv.env['AUTH_BASE_URL'] ?? '',
    );
  }
}
