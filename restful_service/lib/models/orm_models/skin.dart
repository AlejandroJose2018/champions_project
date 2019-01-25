import '../../aqueduct_app.dart';
import 'champion.dart';

@Table(name: "skins")
class _Skin {
  @Column(primaryKey: true) int skinId;
  String name;
  String splashPath;

  @Relate(#skins, onDelete: DeleteRule.cascade, isRequired: true)
  Champion champion;
}

class Skin extends ManagedObject<_Skin> implements _Skin {}