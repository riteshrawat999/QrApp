import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:qr_scanner_app/bloc/scanned/scanned_bloc.dart';
import 'package:qr_scanner_app/presentation/widgets/scannedTabItem.dart';

class ScannedTab extends StatefulWidget {
  const ScannedTab({super.key});

  @override
  State<ScannedTab> createState() => _ScannedTabState();
}

class _ScannedTabState extends State<ScannedTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ScannedBloc, ScannedState>(
          builder: (context, state) {
            if(state is ScannedDataLoading){
              return Center(child: CircularProgressIndicator(),);
            }
            if (state is ReturnScannedData) {
              // print(state.data.first.barcode);
              return scannedTabItem(state,context);
            }
            return Text("data is not available");
          },
        ),
      ),
    );
  }
}
