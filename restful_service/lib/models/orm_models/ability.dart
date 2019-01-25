import '../../aqueduct_app.dart';
import 'champion.dart';

@Table(name: "ability")
class _Ability {
  @Column(primaryKey: true) int id;
  String name;
  String pictureUrl;

  @Relate(#abilities, onDelete: DeleteRule.cascade, isRequired: true)
  Champion champion;
}

class Ability extends ManagedObject<_Ability> implements _Ability {}