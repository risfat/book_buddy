import 'core/config/flavor_config.dart';
import 'main.dart' as app;

void main() {
  FlavorConfig(
    flavor: Flavor.development,
    name: 'DEVELOPMENT',
    apiBaseUrl: 'https://www.googleapis.com',
  );
  app.main();
}
