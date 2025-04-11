import 'core/config/flavor_config.dart';
import 'main.dart' as app;

void main() {
  FlavorConfig(
    flavor: Flavor.staging,
    name: 'STAGING',
    apiBaseUrl: 'https://www.googleapis.com',
  );
  app.main();
}
