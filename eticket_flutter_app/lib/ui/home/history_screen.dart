import 'package:eticket_flutter_app/core/app_color.dart';
import 'package:eticket_flutter_app/core/assets.const.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Transaction History',
          style: TextStyle(
            color: AppColor.mainColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 37),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'bulan ini'.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        height: 3,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: AppColor.mainColor,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Rp 1.000.000'.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: AppColor.mainColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              ListView.separated(
                itemCount: 9,
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 5);
                },
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.grey),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(AssetsConst.addTicket),
                              SizedBox(width: 9),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Penjualan',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.07,
                                      color: AppColor.greytext,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Hari ini, 10.00 WIB',
                                    style: TextStyle(
                                      fontSize: 13.18,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Text(
                            'Rp. 140.000',
                            style: TextStyle(
                              color: AppColor.mainColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 17.07,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Maret'.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          height: 3,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: AppColor.mainColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Rp 1.000.000'.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        color: AppColor.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
