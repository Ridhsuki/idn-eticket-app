import 'package:eticket_flutter_app/core/app_color.dart';
import 'package:eticket_flutter_app/core/assets.const.dart';
import 'package:eticket_flutter_app/core/components/app_button.dart';
import 'package:eticket_flutter_app/data/model/ticket_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TicketModel> ticketDummmy = [
    TicketModel(
      title: 'Tiket Masuk Dewasa',
      subtitle: 'Nusantara',
      price: 50000,
    ),
    TicketModel(title: 'Tiket Masuk Anak', subtitle: 'Nusantara', price: 20000),
    TicketModel(
      title: 'Tiket Masuk Dewasa',
      subtitle: 'Mancanegara',
      price: 150000,
    ),
    TicketModel(
      title: 'Tiket Masuk Anak',
      subtitle: 'Mancanegara',
      price: 120000,
    ),
    TicketModel(title: 'Tiket Keluarga', subtitle: 'Nusantara', price: 175000),
    TicketModel(
      title: 'Tiket Keluarga',
      subtitle: 'Mancanegara',
      price: 300000,
    ),
  ];

  int totalAmount = 0;
  void updateTotalAmount() {
    int total = 0;
    for (var ticket in ticketDummmy) {
      total += ticket.totalPrice;
    }
    setState(() {
      totalAmount = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: ticketDummmy.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 20);
              },
              itemBuilder: (context, index) {
                var data = ticketDummmy[index];
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == ticketDummmy.length - 1 ? 100 : 0,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColor.grey),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.title, style: TextStyle(fontSize: 15)),
                              Text(
                                data.subtitle,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: AppColor.greytext,
                                ),
                              ),
                              SizedBox(height: 13),
                              Text(
                                'Rp ${data.price}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    icon: Image.asset(AssetsConst.minusIcon),
                                    onPressed: () {
                                      setState(() {
                                        if (data.count == 0) {
                                          return;
                                        } else {
                                          data.count--;
                                          data.totalPrice =
                                              data.price * data.count;
                                          updateTotalAmount();
                                        }
                                      });
                                    },
                                  ),
                                  Text(
                                    data.count.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Image.asset(AssetsConst.plusIcon),
                                    onPressed: () {
                                      setState(() {
                                        data.count++;
                                        data.totalPrice =
                                            data.price * data.count;
                                        updateTotalAmount();
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Text(
                                'Rp ${data.totalPrice}',
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
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Color(0xffffffff),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Summary',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff031222),
                          ),
                        ),
                        Text(
                          'Rp. $totalAmount',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff031222),
                          ),
                        ),
                      ],
                    ),
                    AppButton(
                      title: 'Process',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          'detail-order',
                          arguments: {
                            'selectedTickets':
                                ticketDummmy
                                    .where((ticket) => ticket.count > 0)
                                    .toList(),
                            'totalAmount': totalAmount,
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}