import 'package:eticket_flutter_app/core/app_color.dart';
import 'package:flutter/material.dart';

class PaymentReceiptScreen extends StatelessWidget {
  const PaymentReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: AppColor.mainColor,
        title: Text('Payment Receipt', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 412,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              color: AppColor.mainColor,
            ),
          ),
          Container(
            margin: EdgeInsets.all(25),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Background.png'),
                alignment: Alignment.topCenter,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(35),
              width: 300,
              child: Column(
                children: [
                  Text(
                    'payment receipt'.toUpperCase(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 17,),
                  Image.asset('assets/images/QRCode.png'),
                  SizedBox(height: 17,),
                  Text('Scan this QR code to verify tickets'),
                  SizedBox(height: 21),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Tagihan'), Text('Rp. 120.000')],
                  ),
                  SizedBox(height: 47),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Metode Bayar'),
                          SizedBox(height: 11),
                          Text('Waktu'),
                          SizedBox(height: 8),
                          Text('Status'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,

                        children: [
                          Text('Tunai'),
                          SizedBox(height: 11),
                          Text('17.04.2023'),
                          SizedBox(height: 8),
                          Text('Lunas'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: FloatingActionButton(
            onPressed: () {
              print('hehehaha');
            },
            backgroundColor: AppColor.mainColor,
            child: Text(
              'Cetak Transaksi',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
