import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tradline/model/trading_list_card_model.dart';
import 'package:tradline/model/portfolio_stock_model.dart';
class InitHive {
  // list of hive box name
  static const String i_am_hive_box = "i_am";
  static const String trading_fetched_data = "trading_fetched_data";
  static const String Portfolio_stocks = "Portfolio_stocks";
  static const String buy_sell_history = "buy_sell_history";

  Future<void> init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive..init(dir.path)..registerAdapter(TradingDataModelAdapter())..registerAdapter(PortfolioStockModelAdapter());
    await Hive.openBox(i_am_hive_box);
    await Hive.openBox<TradingDataModel>(trading_fetched_data);
    await Hive.openBox<PortfolioStockModel>(Portfolio_stocks);
    await Hive.openBox<PortfolioStockModel>(buy_sell_history);
  }
}
