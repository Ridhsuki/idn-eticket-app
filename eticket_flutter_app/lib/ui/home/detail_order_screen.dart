import 'package:eticket_flutter_app/core/app_color.dart';
import 'package:eticket_flutter_app/core/assets.const.dart';
import 'package:eticket_flutter_app/core/components/app_button.dart';
import 'package:eticket_flutter_app/data/model/ticket_model.dart';
import 'package:flutter/material.dart';

class DetailOrderScreen extends StatelessWidget {
  const DetailOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final argument =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final List<TicketModel> selectedTickets = argument['selectedTickets'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset('assets/icons/backBlue.png'),
        ),
        title: Text(
          'Detail Pesanan',
          style: TextStyle(
            color: AppColor.mainColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: selectedTickets.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 20);
              },
              itemBuilder: (context, index) {
                var data = selectedTickets[index];
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == selectedTickets.length - 1 ? 100 : 0,
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
                      child: Column(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rp ${data.price} x ${data.count}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Rp ${data.totalPrice = data.price * data.count}',
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
                              'Rp. ${argument['totalAmount']}',
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
                Image.asset(
                  _selectedIndex == 2
                      ? AssetsConst.activeTransferIcon
                      : AssetsConst.transferIcon,
                ),
                SizedBox(height: 10),
                Text(
                  'Transfer',
                  style: TextStyle(
                    color:
                        _selectedIndex == 2 ? Colors.white : AppColor.mainColor,
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