enum Flavor { development, staging, production }

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final String apiBaseUrl;

  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required String name,
    required String apiBaseUrl,
  }) {
    _instance ??= FlavorConfig._internal(flavor, name, apiBaseUrl);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.apiBaseUrl);

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isProduction() => _instance!.flavor == Flavor.production;
  static bool isStaging() => _instance!.flavor == Flavor.staging;
  static bool isDevelopment() => _instance!.flavor == Flavor.development;
}
