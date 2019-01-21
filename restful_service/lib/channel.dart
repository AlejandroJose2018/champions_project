import 'aqueduct_app.dart';
import 'controllers/champions_controller.dart';
import 'controllers/my_controller.dart';
import 'controllers/roles_controller.dart';
import 'utils/my_configuration.dart';

class AqueductAppChannel extends ApplicationChannel {

  ManagedContext context;

  @override
  Future prepare() async {
    final config = MyConfiguration(options.configurationFilePath);

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final psc = PostgreSQLPersistentStore.fromConnectionInfo(
        config.database.username,
        config.database.password,
        config.database.host,
        config.database.port,
        config.database.databaseName);

    context = ManagedContext(dataModel, psc);
  }

  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router
      .route("")
      .linkFunction((request) async {
        return Response.ok({"entryValue": "value"});
      });

    router
      .route("/roles")
      .link(() => RolesController());

    router
      .route("/champions/[:id]")
      .link(() => ChampionsController());

    router
      .route("/users/[:id]")
      .link(() => MyController());

    return router;
  }
}