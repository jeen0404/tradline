
import 'dart:async';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tradline/model/serializers.dart';
part 'trading_list_card_model.g.dart';

class UpdateTradingModel{
  final double newValue;
  final double percentageChange;
  final bool isPositive;

  UpdateTradingModel(this.newValue,this.percentageChange, this.isPositive);
}

@HiveType(typeId: 1)
abstract class TradingDataModel with HiveObject implements Built<TradingDataModel, TradingDataModelBuilder> {


  @HiveField(1)
  @BuiltValueField(wireName: "symbol")
  @nullable
  String get companyName;

  @HiveField(2)
  @BuiltValueField(wireName: "basevalue")
  @nullable
  double get value;

  static Serializer<TradingDataModel> get serializer => _$tradingDataModelSerializer;

  TradingDataModel._();

    factory TradingDataModel([void Function(TradingDataModelBuilder) updates]) = _$TradingDataModel;

  List<TradingDataModel> deserializeList(data){
    return  deserializeListOf<TradingDataModel>(data).asList();
  }

}




// making it hive object for caching in database

@HiveType(typeId: 2)
class TradingListCardModel  extends HiveObject with Comparable{
  @HiveField(1)
  TradingDataModel tradingDataModel;

  @HiveField(2)
  StreamController<UpdateTradingModel> updateTradingModel= BehaviorSubject();


   /// for shoring by value
  @override
  int compareTo(other) {
    int nameComp = this.tradingDataModel.value.compareTo(tradingDataModel.value);
    if (nameComp == 0) {
      return this.tradingDataModel.companyName.compareTo(this.tradingDataModel.companyName); // '-' for descending
    }
    return nameComp;
  }
}
