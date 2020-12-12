// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_stock_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PortfolioStockModel> _$portfolioStockModelSerializer =
    new _$PortfolioStockModelSerializer();

class _$PortfolioStockModelSerializer
    implements StructuredSerializer<PortfolioStockModel> {
  @override
  final Iterable<Type> types = const [
    PortfolioStockModel,
    _$PortfolioStockModel
  ];
  @override
  final String wireName = 'PortfolioStockModel';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PortfolioStockModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'companyName',
      serializers.serialize(object.companyName,
          specifiedType: const FullType(String)),
      'buyValue',
      serializers.serialize(object.buyValue,
          specifiedType: const FullType(double)),
      'buyQuantity',
      serializers.serialize(object.buyQuantity,
          specifiedType: const FullType(int)),
      'sellValue',
      serializers.serialize(object.sellValue,
          specifiedType: const FullType(double)),
      'sellQuantity',
      serializers.serialize(object.sellQuantity,
          specifiedType: const FullType(int)),
      'isSold',
      serializers.serialize(object.isSold, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  PortfolioStockModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PortfolioStockModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'companyName':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'buyValue':
          result.buyValue = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'buyQuantity':
          result.buyQuantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'sellValue':
          result.sellValue = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'sellQuantity':
          result.sellQuantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'isSold':
          result.isSold = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$PortfolioStockModel extends PortfolioStockModel {
  @override
  final String companyName;
  @override
  final double buyValue;
  @override
  final int buyQuantity;
  @override
  final double sellValue;
  @override
  final int sellQuantity;
  @override
  final bool isSold;

  factory _$PortfolioStockModel(
          [void Function(PortfolioStockModelBuilder) updates]) =>
      (new PortfolioStockModelBuilder()..update(updates)).build();

  _$PortfolioStockModel._(
      {this.companyName,
      this.buyValue,
      this.buyQuantity,
      this.sellValue,
      this.sellQuantity,
      this.isSold})
      : super._() {
    if (companyName == null) {
      throw new BuiltValueNullFieldError('PortfolioStockModel', 'companyName');
    }
    if (buyValue == null) {
      throw new BuiltValueNullFieldError('PortfolioStockModel', 'buyValue');
    }
    if (buyQuantity == null) {
      throw new BuiltValueNullFieldError('PortfolioStockModel', 'buyQuantity');
    }
    if (sellValue == null) {
      throw new BuiltValueNullFieldError('PortfolioStockModel', 'sellValue');
    }
    if (sellQuantity == null) {
      throw new BuiltValueNullFieldError('PortfolioStockModel', 'sellQuantity');
    }
    if (isSold == null) {
      throw new BuiltValueNullFieldError('PortfolioStockModel', 'isSold');
    }
  }

  @override
  PortfolioStockModel rebuild(
          void Function(PortfolioStockModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PortfolioStockModelBuilder toBuilder() =>
      new PortfolioStockModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PortfolioStockModel &&
        companyName == other.companyName &&
        buyValue == other.buyValue &&
        buyQuantity == other.buyQuantity &&
        sellValue == other.sellValue &&
        sellQuantity == other.sellQuantity &&
        isSold == other.isSold;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, companyName.hashCode), buyValue.hashCode),
                    buyQuantity.hashCode),
                sellValue.hashCode),
            sellQuantity.hashCode),
        isSold.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PortfolioStockModel')
          ..add('companyName', companyName)
          ..add('buyValue', buyValue)
          ..add('buyQuantity', buyQuantity)
          ..add('sellValue', sellValue)
          ..add('sellQuantity', sellQuantity)
          ..add('isSold', isSold))
        .toString();
  }
}

class PortfolioStockModelBuilder
    implements Builder<PortfolioStockModel, PortfolioStockModelBuilder> {
  _$PortfolioStockModel _$v;

  String _companyName;
  String get companyName => _$this._companyName;
  set companyName(String companyName) => _$this._companyName = companyName;

  double _buyValue;
  double get buyValue => _$this._buyValue;
  set buyValue(double buyValue) => _$this._buyValue = buyValue;

  int _buyQuantity;
  int get buyQuantity => _$this._buyQuantity;
  set buyQuantity(int buyQuantity) => _$this._buyQuantity = buyQuantity;

  double _sellValue;
  double get sellValue => _$this._sellValue;
  set sellValue(double sellValue) => _$this._sellValue = sellValue;

  int _sellQuantity;
  int get sellQuantity => _$this._sellQuantity;
  set sellQuantity(int sellQuantity) => _$this._sellQuantity = sellQuantity;

  bool _isSold;
  bool get isSold => _$this._isSold;
  set isSold(bool isSold) => _$this._isSold = isSold;

  PortfolioStockModelBuilder();

  PortfolioStockModelBuilder get _$this {
    if (_$v != null) {
      _companyName = _$v.companyName;
      _buyValue = _$v.buyValue;
      _buyQuantity = _$v.buyQuantity;
      _sellValue = _$v.sellValue;
      _sellQuantity = _$v.sellQuantity;
      _isSold = _$v.isSold;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PortfolioStockModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PortfolioStockModel;
  }

  @override
  void update(void Function(PortfolioStockModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PortfolioStockModel build() {
    final _$result = _$v ??
        new _$PortfolioStockModel._(
            companyName: companyName,
            buyValue: buyValue,
            buyQuantity: buyQuantity,
            sellValue: sellValue,
            sellQuantity: sellQuantity,
            isSold: isSold);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PortfolioStockModelAdapter extends TypeAdapter<PortfolioStockModel> {
  @override
  final int typeId = 3;

  @override
  PortfolioStockModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PortfolioStockModel();
  }

  @override
  void write(BinaryWriter writer, PortfolioStockModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.companyName)
      ..writeByte(1)
      ..write(obj.buyValue)
      ..writeByte(2)
      ..write(obj.buyQuantity)
      ..writeByte(3)
      ..write(obj.sellValue)
      ..writeByte(4)
      ..write(obj.sellQuantity)
      ..writeByte(5)
      ..write(obj.isSold);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PortfolioStockModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
