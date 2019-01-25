import 'aqueduct_app.dart';
import 'controllers/champions_controller.dart';
import 'controllers/my_controller.dart';
import 'controllers/roles_controller.dart';

class AqueductAppChannel extends ApplicationChannel {

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