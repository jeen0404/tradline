import 'package:dio/dio.dart';
import 'package:tradline/cache/init_hive.dart';
import 'package:tradline/network/endpoints.dart';
import 'package:tradline/network/invoke.dart';
import 'package:tradline/repository/base_repository.dart';
import 'package:tradline/model/trading_list_card_model.dart';


class StockDataRepository extends TypeAdapterRepository<TradingDataModel>{
  StockDataRepository() : super(InitHive.trading_fetched_data);


  // here we'll going to fetch stock data by using Invoke class from network part
  @override
  Future<List<TradingDataModel>> getAllNetwork({startIndex = 0, endIndex = 50}) async{

    // get data from network
    Response response =await Invoke().get(apiUrl: EndPoints.get_nifty_50_list);

    // convert json to model list
    List<TradingDataModel>  tradingDataModels= TradingDataModel().deserializeList(response.data);

    /// add to cache to instant ui rendering
    this.putAll(tradingDataModels);

    return tradingDataModels;
  }

  @override
  Future<List<TradingDataModel>> putAll(List<TradingDataModel> data) {
    data.forEach((element) {
    this.hiveBox.put(element.companyName, element);
    });
  }
}