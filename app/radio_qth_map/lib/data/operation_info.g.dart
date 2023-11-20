// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AmateurRadioOperationInfoImpl _$$AmateurRadioOperationInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$AmateurRadioOperationInfoImpl(
      id: json['id'] as String?,
      mode: $enumDecodeNullable(_$AmateurRadioModeEnumMap, json['mode']),
      band: AmateurRadioBandInfo.fromJson(json['band'] as Map<String, dynamic>),
      powerOutput: (json['powerOutput'] as num?)?.toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AmateurRadioOperationInfoImplToJson(
        _$AmateurRadioOperationInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mode': _$AmateurRadioModeEnumMap[instance.mode],
      'band': instance.band.toJson(),
      'powerOutput': instance.powerOutput,
      'runtimeType': instance.$type,
    };

const _$AmateurRadioModeEnumMap = {
  AmateurRadioMode.AM: 'AM',
  AmateurRadioMode.ARDOP: 'ARDOP',
  AmateurRadioMode.ATV: 'ATV',
  AmateurRadioMode.CHIP: 'CHIP',
  AmateurRadioMode.CLO: 'CLO',
  AmateurRadioMode.CONTESTI: 'CONTESTI',
  AmateurRadioMode.CW: 'CW',
  AmateurRadioMode.DIGITALVOICE: 'DIGITALVOICE',
  AmateurRadioMode.DOMINO: 'DOMINO',
  AmateurRadioMode.DYNAMIC: 'DYNAMIC',
  AmateurRadioMode.FAX: 'FAX',
  AmateurRadioMode.FM: 'FM',
  AmateurRadioMode.FSK441: 'FSK441',
  AmateurRadioMode.FT8: 'FT8',
  AmateurRadioMode.HELL: 'HELL',
  AmateurRadioMode.ISCAT: 'ISCAT',
  AmateurRadioMode.JT4: 'JT4',
  AmateurRadioMode.JT6M: 'JT6M',
  AmateurRadioMode.JT9: 'JT9',
  AmateurRadioMode.JT44: 'JT44',
  AmateurRadioMode.JT65: 'JT65',
  AmateurRadioMode.MFSK: 'MFSK',
  AmateurRadioMode.MSK144: 'MSK144',
  AmateurRadioMode.MT63: 'MT63',
  AmateurRadioMode.OLIVIA: 'OLIVIA',
  AmateurRadioMode.OPERA: 'OPERA',
  AmateurRadioMode.PAC: 'PAC',
  AmateurRadioMode.PAX: 'PAX',
  AmateurRadioMode.PKT: 'PKT',
  AmateurRadioMode.PSK: 'PSK',
  AmateurRadioMode.PSK2K: 'PSK2K',
  AmateurRadioMode.Q15: 'Q15',
  AmateurRadioMode.QRA64: 'QRA64',
  AmateurRadioMode.ROS: 'ROS',
  AmateurRadioMode.RTTY: 'RTTY',
  AmateurRadioMode.RTTYM: 'RTTYM',
  AmateurRadioMode.SSB: 'SSB',
  AmateurRadioMode.SSTV: 'SSTV',
  AmateurRadioMode.T10: 'T10',
  AmateurRadioMode.THOR: 'THOR',
  AmateurRadioMode.THRB: 'THRB',
  AmateurRadioMode.TOR: 'TOR',
  AmateurRadioMode.V4: 'V4',
  AmateurRadioMode.VOI: 'VOI',
  AmateurRadioMode.WINMOR: 'WINMOR',
  AmateurRadioMode.WSPR: 'WSPR',
  AmateurRadioMode.AMTORFEC: 'AMTORFEC',
  AmateurRadioMode.ASCI: 'ASCI',
  AmateurRadioMode.C4FM: 'C4FM',
  AmateurRadioMode.CHIP64: 'CHIP64',
  AmateurRadioMode.CHIP128: 'CHIP128',
  AmateurRadioMode.DOMINOF: 'DOMINOF',
  AmateurRadioMode.DSTAR: 'DSTAR',
  AmateurRadioMode.FMHELL: 'FMHELL',
  AmateurRadioMode.FSK31: 'FSK31',
  AmateurRadioMode.GTOR: 'GTOR',
  AmateurRadioMode.HELL80: 'HELL80',
  AmateurRadioMode.HFSK: 'HFSK',
  AmateurRadioMode.JT4A: 'JT4A',
  AmateurRadioMode.JT4B: 'JT4B',
  AmateurRadioMode.JT4C: 'JT4C',
  AmateurRadioMode.JT4D: 'JT4D',
  AmateurRadioMode.JT4E: 'JT4E',
  AmateurRadioMode.JT4F: 'JT4F',
  AmateurRadioMode.JT4G: 'JT4G',
  AmateurRadioMode.JT65A: 'JT65A',
  AmateurRadioMode.JT65B: 'JT65B',
  AmateurRadioMode.JT65C: 'JT65C',
  AmateurRadioMode.MFSK8: 'MFSK8',
  AmateurRadioMode.MFSK16: 'MFSK16',
  AmateurRadioMode.PAC2: 'PAC2',
  AmateurRadioMode.PAC3: 'PAC3',
  AmateurRadioMode.PAX2: 'PAX2',
  AmateurRadioMode.PCW: 'PCW',
  AmateurRadioMode.PSK10: 'PSK10',
  AmateurRadioMode.PSK31: 'PSK31',
  AmateurRadioMode.PSK63: 'PSK63',
  AmateurRadioMode.PSK63F: 'PSK63F',
  AmateurRadioMode.PSK125: 'PSK125',
  AmateurRadioMode.PSKAM10: 'PSKAM10',
  AmateurRadioMode.PSKAM31: 'PSKAM31',
  AmateurRadioMode.PSKAM50: 'PSKAM50',
  AmateurRadioMode.PSKFEC31: 'PSKFEC31',
  AmateurRadioMode.PSKHELL: 'PSKHELL',
  AmateurRadioMode.QPSK31: 'QPSK31',
  AmateurRadioMode.QPSK63: 'QPSK63',
  AmateurRadioMode.QPSK125: 'QPSK125',
  AmateurRadioMode.THRBX: 'THRBX',
};

_$FreeLicenseRadioOperationInfoImpl
    _$$FreeLicenseRadioOperationInfoImplFromJson(Map<String, dynamic> json) =>
        _$FreeLicenseRadioOperationInfoImpl(
          id: json['id'] as String?,
          mode: $enumDecode(_$FreeLicenseRadioModeEnumMap, json['mode']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$FreeLicenseRadioOperationInfoImplToJson(
        _$FreeLicenseRadioOperationInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mode': _$FreeLicenseRadioModeEnumMap[instance.mode]!,
      'runtimeType': instance.$type,
    };

const _$FreeLicenseRadioModeEnumMap = {
  FreeLicenseRadioMode.personalUse: 'personalUse',
  FreeLicenseRadioMode.lcr: 'lcr',
  FreeLicenseRadioMode.dcr: 'dcr',
  FreeLicenseRadioMode.citizensBand: 'citizensBand',
};
