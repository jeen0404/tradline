// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trading_list_card_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TradingDataModel> _$tradingDataModelSerializer =
    new _$TradingDataModelSerializer();

class _$TradingDataModelSerializer
    implements StructuredSerializer<TradingDataModel> {
  @override
  final Iterable<Type> types = const [TradingDataModel, _$TradingDataModel];
  @override
  final String wireName = 'TradingDataModel';

  @override
  Iterable<Object> serialize(Serializers serializers, TradingDataModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.companyName != null) {
      result
        ..add('symbol')
        ..add(serializers.serialize(object.companyName,
            specifiedType: const FullType(String)));
    }
    if (object.value != null) {
      result
        ..add('basevalue')
        ..add(serializers.serialize(object.value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  TradingDataModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TradingDataModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'symbol':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'basevalue':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$TradingDataModel extends TradingDataModel {
  @override
  final String companyName;
  @override
  final double value;

  factory _$TradingDataModel(
          [void Function(TradingDataModelBuilder) updates]) =>
      (new TradingDataModelBuilder()..update(updates)).build();

  _$TradingDataModel._({this.companyName, this.value}) : super._();

  @override
  TradingDataModel rebuild(void Function(TradingDataModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TradingDataModelBuilder toBuilder() =>
      new TradingDataModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TradingDataModel &&
        companyName == other.companyName &&
        value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, companyName.hashCode), value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TradingDataModel')
          ..add('companyName', companyName)
          ..add('value', value))
        .toString();
  }
}

class TradingDataModelBuilder
    implements Builder<TradingDataModel, TradingDataModelBuilder> {
  _$TradingDataModel _$v;

  String _companyName;
  String get companyName => _$this._companyName;
  set companyName(String companyName) => _$this._companyName = companyName;

  double _value;
  double get value => _$this._value;
  set value(double value) => _$this._value = value;

  TradingDataModelBuilder();

  TradingDataModelBuilder get _$this {
    if (_$v != null) {
      _companyName = _$v.companyName;
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TradingDataModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TradingDataModel;
  }

  @override
  void update(void Function(TradingDataModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TradingDataModel build() {
    final _$result =
        _$v ?? new _$TradingDataModel._(companyName: companyName, value: value);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TradingDataModelAdapter extends TypeAdapter<TradingDataModel> {
  @override
  final int typeId = 1;

  @override
  TradingDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TradingDataModel();
  }

  @override
  void write(BinaryWriter writer, TradingDataModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.companyName)
      ..writeByte(2)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TradingDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TradingListCardModelAdapter extends TypeAdapter<TradingListCardModel> {
  @override
  final int typeId = 2;

  @override
  TradingListCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TradingListCardModel()
      ..tradingDataModel = fields[1] as TradingDataModel
      ..updateTradingModel = fields[2] as StreamController<UpdateTradingModel>;
  }

  @override
  void write(BinaryWriter writer, TradingListCardModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.tradingDataModel)
      ..writeByte(2)
      ..write(obj.updateTradingModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TradingListCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
