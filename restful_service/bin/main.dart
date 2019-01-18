import 'package:aqueduct_app/aqueduct_app.dart';

Future main() async {
  final app = Application<AqueductAppChannel>()
      ..options.configurationFilePath = "config.yaml"
      ..options.port = 8888;

  final count = Platform.numberOfProcessors ~/ 1;
  await app.start(numberOfInstances: count > 0 ? count : 1);

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}