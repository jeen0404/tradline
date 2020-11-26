import 'package:tradline/cache/init_hive.dart';

import 'base_repository.dart';

class NameRepository extends SingleKeyRepository<String> {
  NameRepository() : super(InitHive.i_am_hive_box, "name");
}
