import '../../aqueduct_app.dart';

@Table(name: "roles")
class _Role {
  @Column(primaryKey: true) int id;
  String name;
}

class Role extends ManagedObject<_Role> implements _Role {}