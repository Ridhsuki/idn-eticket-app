import 'package:eticket_flutter_app/core/app_color.dart';
import 'package:eticket_flutter_app/core/assets.const.dart';
import 'package:eticket_flutter_app/core/components/app_button.dart';
import 'package:eticket_flutter_app/data/model/ticket_model.dart';
import 'package:flutter/material.dart';

class DetailOrderScreen extends StatelessWidget {
  DetailOrderScreen({super.key});

  final List<TicketModel> orderDetailDummmy = [
    TicketModel(
      title: 'Tiket Masuk Dewasa',
      subtitle: 'Nusantara',
      price: 50000,
    ),
    TicketModel(title: 'Tiket Masuk Anak', subtitle: 'Nusantara', price: 20000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(Icons.arrow_back_rounded, color: AppColor.mainColor),
        // ),
        title: Text(
          'Detail Pesanan',
          style: TextStyle(color: AppColor.mainColor, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: orderDetailDummmy.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 20);
              },
              itemBuilder: (context, index) {
                var data = orderDetailDummmy[index];
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == orderDetailDummmy.length - 1 ? 100 : 0,
                  ),
                  child: ItemCardOrderDetail(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PaymentMethodButton(),
                  Container(
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
                        AppButton(
                          title: 'Process',
                          onPressed: () {
                            Navigator.pushNamed(context, 'payment-receipt');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodButton extends StatefulWidget {
  const PaymentMethodButton({super.key});

  @override
  State<PaymentMethodButton> createState() => _PaymentMethodButtonState();
}

class _PaymentMethodButtonState extends State<PaymentMethodButton> {
  // Variabel untuk melacak tombol yang aktif
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
          child: Container(
            width: 98,
            height: 90,
            decoration: BoxDecoration(
              color: _selectedIndex == 0 ? AppColor.mainColor : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Color(0xffEEEEF7)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  _selectedIndex == 0
                      ? AssetsConst.activeQrisIcon
                      : AssetsConst.qrisIcon,
                ),
                SizedBox(height: 10),
                Text(
                  'QRIS',
                  style: TextStyle(
                    color:
                        _selectedIndex == 0 ? Colors.white : AppColor.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = 1;
            });
          },
          child: Container(
            width: 98,
            height: 90,
            decoration: BoxDecoration(
              color: _selectedIndex == 1 ? AppColor.mainColor : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Color(0xffEEEEF7)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  _selectedIndex == 1
                      ? AssetsConst.activeTunaiIcon
                      : AssetsConst.tunaiIcon,
                ),
                SizedBox(height: 10),
                Text(
                  'Tunai',
                  style: TextStyle(
                    color:
                        _selectedIndex == 1 ? Colors.white : AppColor.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = 2;
            });
          },
          child: Container(
            width: 98,
            height: 90,
            decoration: BoxDecoration(
              color: _selectedIndex == 2 ? AppColor.mainColor : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Color(0xffEEEEF7)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(_selectedIndex == 2 ? AssetsConst.activeTransferIcon : AssetsConst.transferIcon),
                SizedBox(height: 10),
                Text(
                  'Transfer',
                  style: TextStyle(
                    color: _selectedIndex == 2 ? Colors.white : AppColor.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable // Detail Order Card
class ItemCardOrderDetail extends StatefulWidget {
  ItemCardOrderDetail({
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
  State<ItemCardOrderDetail> createState() => _ItemCardOrderDetailState();
}

class _ItemCardOrderDetailState extends State<ItemCardOrderDetail> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: TextStyle(fontSize: 15)),
            Text(
              widget.subtitle,
              style: TextStyle(fontSize: 11, color: AppColor.greytext),
            ),
            SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rp ${widget.price} x 2',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
