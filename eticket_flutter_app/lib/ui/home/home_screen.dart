import 'package:eticket_flutter_app/core/app_color.dart';
import 'package:eticket_flutter_app/core/assets.const.dart';
import 'package:flutter/material.dart';

final List<Map> dummyData = [
  {
    'title': 'Tiket Masuk Dewasa',
    'category': 'Nusantara',
    'price': 50000,
    'amount': 2,
  },
  {
    'title': 'Tiket Masuk Anak',
    'category': 'Nusantara',
    'price': 20000,
    'amount': 2,
  },
  {
    'title': 'Tiket Masuk Dewasa',
    'category': 'MancaNegara',
    'price': 150000,
    'amount': 0,
  },
  {
    'title': 'Tiket Masuk Anak',
    'category': 'MancaNegara',
    'price': 40000,
    'amount': 0,
  },
  {
    'title': 'Tiket Masuk Bayi',
    'category': 'MancaNegara/Nusantara',
    'price': 0,
    'amount': 0,
  },
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Penjualan',
          style: TextStyle(
            color: AppColor.mainColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: AppCard(),
      ),
    );
  }
}

class AppCard extends StatelessWidget {
  const AppCard({super.key, });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 2,
                color: Color(0xffffffff),
                shadowColor: Color(0xffE7EAED),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tiket Masuk Dewasa',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff031222),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Nusantara',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xff50565C),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(AssetsConst.minusIcon),
                              ),
                              Text(
                                '2',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(AssetsConst.plusIcon),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 13),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp.50.000',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Rp.100.000',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
