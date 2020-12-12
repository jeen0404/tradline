

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hive/hive.dart';

part 'portfolio_stock_model.g.dart';

@HiveType(typeId: 3)
abstract class PortfolioStockModel with HiveObject implements Built<PortfolioStockModel, PortfolioStockModelBuilder> {

  static Serializer<PortfolioStockModel> get serializer => _$portfolioStockModelSerializer;

  @HiveField(0)
  String get companyName;

  @HiveField(1)
  double get buyValue;

  @HiveField(2)
  int get buyQuantity;

  @HiveField(3)
  double get sellValue;

  @HiveField(4)
  int get sellQuantity;

  @HiveField(5)
  bool get isSold;

  PortfolioStockModel._();
  factory PortfolioStockModel([void Function(PortfolioStockModelBuilder) updates]) = _$PortfolioStockModel;

}