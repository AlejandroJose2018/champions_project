import '../../aqueduct_app.dart';
import 'champion.dart';

@Table(name: "roles")
class _Role {
  @Column(primaryKey: true) int id;
  String name;

  ManagedSet<Champion> champions;
}

class Role extends ManagedObject<_Role> implements _Role {}