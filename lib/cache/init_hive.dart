import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class InitHive {
  Future<void> init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }
}
