import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:qr_scanner_app/models/scanned_history_model.dart';
import 'package:qr_scanner_app/services/db_services.dart';

part 'scanned_event.dart';
part 'scanned_state.dart';

class ScannedBloc extends Bloc<ScannedEvent, ScannedState> {
  ScannedBloc() : super(ScannedInitial()) {
    on<ScannedOpenEvent>((event, emit) async{
      // emit(ScannedDataLoading());
      try{
        emit(ReturnScannedData( await DBHelper.getScannedHistory()));
      }catch(error){
        // emit(ScannedDataFailure('Data Can not loading now.. : $error'));
      }
    });
  }
}
