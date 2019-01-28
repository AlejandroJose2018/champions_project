import 'dart:async';
import '../aqueduct_app.dart';
import 'my_configuration.dart';

class DbHelper {

  /* CONSTRUCTORS */

  factory DbHelper() {
    return _singleton;
  }

  DbHelper._internal();

  /* GLOBAL */

  static final DbHelper _singleton = DbHelper._internal();
  ManagedContext _managedContext;
  ApplicationOptions applicationOptions;

  /* PUBLIC METHODS */

  ManagedContext getManagedContext() {
    return _managedContext;
  }

  /* PRIVATE METHODS */
  void _initializeManagedContext() {
    final config = MyConfiguration(applicationOptions.configurationFilePath);

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final psc = PostgreSQLPersistentStore.fromConnectionInfo(
        config.database.username,
        config.database.password,
        config.database.host,
        config.database.port,
        config.database.databaseName);

    _managedContext = ManagedContext(dataModel, psc);
  }
}
