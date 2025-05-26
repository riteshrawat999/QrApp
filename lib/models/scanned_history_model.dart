import 'package:mobile_scanner/mobile_scanner.dart';

class ScannedHistoryModel {
  final int? scanId;
  final String barcode;
  final dynamic format;
  final String timeStamp;
  final int isFavorite;

  const ScannedHistoryModel({
     this.scanId,
    required this.barcode,
    required this.format,
    required this.timeStamp,
    required this.isFavorite,
  });

  factory ScannedHistoryModel.fromJson(Map<String, dynamic> json) =>
      ScannedHistoryModel(
        scanId: json['scanId'],
        barcode: json['barcode'],
        format: json['format'],
        timeStamp: json['timeStamp'],
        isFavorite: json['isFavorite'],
      );

  Map<String, dynamic> toJson() => {
    'scanId': scanId,
    'barcode': barcode,
    'format': format,
    'timeStamp': timeStamp,
    'isFavorite': isFavorite,
  };
}
