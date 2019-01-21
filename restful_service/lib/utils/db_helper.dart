import 'dart:async';
import '../aqueduct_app.dart';

class MyApplicationChannel extends ApplicationChannel {
  ManagedContext context;

  @override
  Future prepare() async {
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final psc = PostgreSQLPersistentStore.fromConnectionInfo(
        "my_app_name_user",
        "password",
        "localhost",
        5432,
        "my_app_name");

    context = ManagedContext(dataModel, psc);
  }

  @override
  Controller get entryPoint => null;

}