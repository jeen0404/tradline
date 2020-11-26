library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:tradline/model/trading_list_card_model.dart';
part 'serializers.g.dart';

@SerializersFor(const [
  TradingDataModel

])
Serializers serializers = _$serializers;
Serializers standardSerializers =
(serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();

T deserialize<T>(dynamic value) =>
    standardSerializers.deserializeWith<T>(standardSerializers.serializerForType(T), value);

BuiltList<T> deserializeListOf<T>(dynamic value) =>
    BuiltList.from(value.map((value) => deserialize<T>(value)).toList(growable: false));