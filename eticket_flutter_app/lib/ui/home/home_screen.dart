import 'package:eticket_flutter_app/core/app_color.dart';
import 'package:eticket_flutter_app/core/assets.const.dart';
import 'package:eticket_flutter_app/core/components/app_button.dart';
import 'package:eticket_flutter_app/data/model/ticket_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

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
    TicketModel(
      title: 'Tiket Keluarga',
      subtitle: 'Mancanegara',
      price: 200000,
    ),
  ];



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
                  child: ItemCardHome(
                    title: data.title,
                    subtitle: data.subtitle,
                    price: data.price,
                    count: data.count,
                    totalPrice: data.totalPrice,
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
                          'Rp. 999999999++',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff031222),
                          ),
                        ),
                      ],
                    ),
                    AppButton(title: 'Process', onPressed: () {}),
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

class ItemCardHome extends StatefulWidget {
  ItemCardHome({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.count,
    required this.totalPrice,
  });
  final String title;
  final String subtitle;
  final int price;
  int count;
  int totalPrice;

  @override
  State<ItemCardHome> createState() => _ItemCardHomeState();
}

class _ItemCardHomeState extends State<ItemCardHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColor.grey),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: TextStyle(fontSize: 15)),
                Text(
                  widget.subtitle,
                  style: TextStyle(fontSize: 11, color: AppColor.greytext),
                ),
                SizedBox(height: 13),
                Text(
                  'Rp ${widget.price}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Image.asset(AssetsConst.minusIcon),
                      onPressed: () {
                        setState(() {
                          if (widget.count == 0) {
                            return;
                          } else {
                            widget.count--;
                          }
                        });
                      },
                    ),
                    Text(
                      widget.count.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    IconButton(
                      icon: Image.asset(AssetsConst.plusIcon),
                      onPressed: () {
                        setState(() {
                          widget.count++;
                        });
                      },
                    ),
                  ],
                ),
                Text(
                  'Rp ${widget.totalPrice = widget.price * widget.count}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}