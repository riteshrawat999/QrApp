import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:qr_scanner_app/bloc/scanned/scanned_bloc.dart';
import 'package:qr_scanner_app/models/scanned_history_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const String _dbName = "scannedHistory.db";
  static const int _dbVersion = 1;
  static const String _tableName = "scannedHistoryTable";

  static Future<Database> _getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, dbVersion) async {
        return await db.execute(
          "CREATE TABLE $_tableName(scanId INTEGER PRIMARY KEY,barcode TEXT NOT NULL,format TEXT,timeStamp TEXT NOT NULL,isFavorite INTEGER)",
        );
      },
      version: _dbVersion,
    );
  }

  // insert scanned data
  static Future<void> insertScannedHistory({
    required ScannedHistoryModel data,
    required BuildContext context,
  }) async {
    final db = await _getDB();
    try {
      db.insert(
        _tableName,
        data.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      Fluttertoast.showToast(
        msg: "Successfully Save Scanned",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      context.read<ScannedBloc>().add(ScannedOpenEvent());
      Navigator.pop(context);
    } catch (error) {
      Fluttertoast.showToast(
        msg: "Failed Scanned : $error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  // Get All Scanned Data
  static Future<List<ScannedHistoryModel>> getScannedHistory() async {
    final db = await _getDB();
    List<Map<String, dynamic>> maps = await db.query(_tableName);
    return maps
        .map((scannedData) => ScannedHistoryModel.fromJson(scannedData))
        .toList();
  }

  // Delete Scanned Data
  static Future<void> deleteScannedItem({required int? scanId,required BuildContext context}) async {
    final db = await _getDB();
    db.delete(_tableName, where: 'scanId=?', whereArgs: [scanId]);
    context.read<ScannedBloc>().add(ScannedOpenEvent());
  }
}
