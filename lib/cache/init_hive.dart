import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tradline/model/trading_list_card_model.dart';
class InitHive {
  // list of hive box name
  static const String i_am_hive_box = "i_am";
  static const String trading_fetched_data = "trading_fetched_data";

  Future<void> init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive..init(dir.path)..registerAdapter(TradingDataModelAdapter());
    await Hive.openBox(i_am_hive_box);
    await Hive.openBox<TradingDataModel>(trading_fetched_data);
  }
}
