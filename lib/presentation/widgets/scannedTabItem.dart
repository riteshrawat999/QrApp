import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_scanner_app/services/db_services.dart';
import 'package:qr_scanner_app/utils/alert_dialog_custome.dart';
import '../../utils/open_link.dart';

Widget scannedTabItem(var state, BuildContext context) {
  final double screenWidth = MediaQuery.of(context).size.width;
  return ListView.builder(
    itemCount: state.data.length,
    itemBuilder: (context, index) {
      final data = state.data[index];
      return GestureDetector(
        onTap: () {
          launchedScannerUrl(state.barcode, context);
        },
        child: Card(
          elevation: 2.0,
          color: Color(0xfff6f6f6),
          child: ListTile(
            title: Text(data.format),
            subtitle: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.barcode.toString(),overflow: TextOverflow.ellipsis,),
                  // SizedBox(height: screenWidth * 0.01,),
                  Text(data.timeStamp.toString()),
                ],
              ),
            ),
            trailing: InkWell(
              onTap: () {
                alertDialog(
                  context: context,
                  title: Column(
                    children: [
                      Icon(
                        LucideIcons.circle_help,
                        color: Colors.red,
                        size: screenWidth * 0.09,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Are you sure ?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  content: 'Do you realy want to delete this data.',
                  onPressed: () async {
                    await DBHelper.deleteScannedItem(
                      scanId: data.scanId,
                      context: context,
                    );
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                      msg: 'Successfully Deleted..',
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      gravity: ToastGravity.CENTER,
                    );
                  },
                );
              },
              child: Icon(LucideIcons.trash_2,color: Colors.red.shade500,),
            ), // delete icon
          ),
        ),
      );
    },
  );
}
