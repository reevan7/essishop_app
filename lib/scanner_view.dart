import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Simple Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result),
            ElevatedButton(
              onPressed: () async {
                String? res = await SimpleBarcodeScanner.scanBarcode(
                  context,
                  barcodeAppBar: const BarcodeAppBar(
                    appBarTitle: 'Test',
                    centerTitle: false,
                    enableBackButton: true,
                    backButtonIcon: Icon(Icons.arrow_back_ios),
                  ),
                  isShowFlashIcon: true,
                  delayMillis: 2000,
                  cameraFace: CameraFace.front,
                );
                setState(() {
                  result = res as String;
                });
              },
              child: const Text('Open Scanner'),
            ),
          ],
        ),
      ),
    );
  }
}
