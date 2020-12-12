


import 'package:tradline/cache/init_hive.dart';
import 'package:tradline/repository/base_repository.dart';
import 'package:tradline/model/portfolio_stock_model.dart';

class PortfolioRepository extends TypeAdapterRepository<PortfolioStockModel>{
  PortfolioRepository() : super(InitHive.Portfolio_stocks);

}

class PortfolioHistory extends TypeAdapterRepository<PortfolioStockModel>{
  PortfolioHistory() : super(InitHive.Portfolio_stocks);

}