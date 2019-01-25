import 'dart:async';
import '../aqueduct_app.dart';
import 'my_configuration.dart';

class DbHelper {

  ManagedContext context;
  ApplicationOptions applicationOptions;

  void start() {
    final config = MyConfiguration(applicationOptions.configurationFilePath);

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final psc = PostgreSQLPersistentStore.fromConnectionInfo(
        config.database.username,
        config.database.password,
        config.database.host,
        config.database.port,
        config.database.databaseName);

    context = ManagedContext(dataModel, psc);
  }

}
