
import 'enum_class.dart';

class BarcodeTypeDiff{
  String barcode(String format){
    if(format == BarcodeFormat.qrCode.name){
      return "QR Code";
    } else if(format == BarcodeFormat.code128.toString()){
      return "Barcode (Shipping)" ;
    } else if(format == BarcodeFormat.itf.name){
      return "Barcode (Packaging)";
    }
    else{
      return format;
    }
  }
}