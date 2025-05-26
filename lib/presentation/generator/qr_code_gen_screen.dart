import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrCodeGenScreen extends StatefulWidget {
  const QrCodeGenScreen({super.key});

  @override
  State<QrCodeGenScreen> createState() => _QrCodeGenScreenState();
}

class _QrCodeGenScreenState extends State<QrCodeGenScreen> {
  String? qrCode;
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Visibility(visible: false, child: Text("")),
        title: Text(
          "Gen QR Code",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontSize: screenWidth * 0.07,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: "Enter qr code text"),
              onSubmitted: (value) {
                setState(() {
                  qrCode = value;
                });
              },
            ),
            SizedBox(height: screenHight * 0.02),
            if (qrCode != null)
              SizedBox(
                height: screenHight * 0.2,

                child: PrettyQrView.data(
                  data: qrCode!,
                  decoration: PrettyQrDecoration(
                    shape: PrettyQrSmoothSymbol(color: kDefaultIconDarkColor),
                    background: Colors.transparent,
                    quietZone: PrettyQrQuietZone.zero,
                  ),
                ),
              ), // qr code gen
            SizedBox(height: screenHight * 0.02),
            Chip(
              label: InkWell(
                onTap: () {
                  qrCode = '';
                  qrCode = _textController.text.toString().trim();
                  setState(() {});
                },
                child: Text(
                  qrCode == null ? 'Generate' : 'Save',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: screenHight * 0.02,
                  ),
                ),
              ),
              avatar: Icon(Icons.generating_tokens, color: Color(0xff063970)),
            ),
          ],
        ),
      ),
    );
  }
}
