import 'core/config/flavor_config.dart';
import 'main.dart' as app;

void main() {
  FlavorConfig(
    flavor: Flavor.staging,
    name: 'STAGING',
    apiBaseUrl: 'https://api.staging.example.com',
  );
  app.main();
}
