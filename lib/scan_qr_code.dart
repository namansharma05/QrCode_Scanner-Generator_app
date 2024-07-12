import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String QrResult = 'Second Data will appear here';
  Future<void> scanQr() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
      if (!mounted) return;
      setState(() {
        QrResult = qrCode.toString();
      });
    } on PlatformException {
      QrResult = 'Fail to Read Qr Code';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              QrResult,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: scanQr,
              child: Text('Scan Code'),
            ),
          ],
        ),
      ),
    );
  }
}
