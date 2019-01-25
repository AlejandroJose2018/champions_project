import '../../aqueduct_app.dart';
import 'ability.dart';
import 'review.dart';
import 'role.dart';
import 'skin.dart';

@Table(name: "champions")
class _Champion {
  @Column(primaryKey: true)
  int id;

  String name;
  String description;
  String title;
  Role role;

  ManagedSet<Skin> skins;
  ManagedSet<Ability> abilities;
  ManagedSet<Review> reviews;
}

class Champion extends ManagedObject<_Champion> implements _Champion {}