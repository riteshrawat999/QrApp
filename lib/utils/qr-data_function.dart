import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_app/bloc/contact/contact_qrcode_generate_bloc.dart';
import 'package:qr_scanner_app/utils/toast.dart';

class QrDataFunction {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final BuildContext context;
  String qrData = '';
  QrDataFunction({
    required this.context,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneController,
  });

  void genQrData() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty) {
      Toast.showError(message: 'Please fill all fields');
      return;
    }
    context.read<ContactQrcodeGenerateBloc>().add(
      GenerateContactQrcode(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        phone: phoneController.text,
      ),
    );
  }
}
