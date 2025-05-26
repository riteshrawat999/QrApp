import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:qr_scanner_app/bloc/scanner/scanner_bloc.dart';
import 'package:flutter/material.dart';

class ScannerDismis extends StatelessWidget {
  const ScannerDismis({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScannerBloc, ScannerState>(
      builder: (context, state) {
        return IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
         icon:  Icon(state is ScannerSuccess ? LucideIcons.x : LucideIcons.x,
          color:
              state is ScannerSuccess
                  ? Theme.of(context).textTheme.bodyLarge?.color
                  : Colors.transparent,
         )
        );
      },
    );
  }
}
