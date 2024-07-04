// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      addressId: (json['addressId'] as num?)?.toInt(),
      addressUserid: json['addressUserid'] as String?,
      addressCity: json['addressCity'] as String?,
      addressStreet: json['addressStreet'] as String?,
      addressLat: (json['addressLat'] as num?)?.toDouble(),
      addressLong: (json['addressLong'] as num?)?.toDouble(),
      addressName: json['addressName'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'addressId': instance.addressId,
      'addressUserid': instance.addressUserid,
      'addressCity': instance.addressCity,
      'addressStreet': instance.addressStreet,
      'addressLat': instance.addressLat,
      'addressLong': instance.addressLong,
      'addressName': instance.addressName,
    };
