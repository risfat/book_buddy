import 'core/config/flavor_config.dart';
import 'main.dart' as app;

void main() {
  FlavorConfig(
    flavor: Flavor.production,
    name: 'PRODUCTION',
    apiBaseUrl: 'https://www.googleapis.com',
  );
  app.main();
}
