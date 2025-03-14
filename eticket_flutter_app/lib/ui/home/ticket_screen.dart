import 'package:eticket_flutter_app/core/app_color.dart';
import 'package:eticket_flutter_app/core/assets.const.dart';
import 'package:eticket_flutter_app/core/components/app_button.dart';
import 'package:flutter/material.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ticketNameControler = TextEditingController();
    final priceController = TextEditingController();
    String kategoriValue = '';
    String kriteriaValue = '';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Kelola Tiket',
          style: TextStyle(
            color: AppColor.mainColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(AssetsConst.addTicket),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Nama'),
                          SizedBox(height: 8),
                          TextField(
                            controller: ticketNameControler,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Nama Tiket',
                            ),
                          ),
                          SizedBox(height: 8),
                          Text('Harga'),
                          SizedBox(height: 8),
                          TextField(
                            controller: priceController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Harga Tiket',
                            ),
                          ),
                          SizedBox(height: 8),
                          Text('Kategori'),
                          SizedBox(height: 8),
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Kategori',
                            ),
                            items: [
                              DropdownMenuItem(
                                value: 'Nusantara',
                                child: Text('Nusantara'),
                              ),
                              DropdownMenuItem(
                                value: 'Mancanegara',
                                child: Text('Mancanegara'),
                              ),
                            ],
                            onChanged: (value) {
                              kategoriValue = value ?? '';
                            },
                          ),
                          SizedBox(height: 8),
                          Text('Kriteria'),
                          SizedBox(height: 8),
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Kriteria',
                            ),
                            items: [
                              DropdownMenuItem(
                                value: 'Perorangan',
                                child: Text('Perorangan'),
                              ),
                              DropdownMenuItem(
                                value: 'Rombongan',
                                child: Text('Rombongan'),
                              ),
                            ],
                            onChanged: (value) {
                              kriteriaValue = value ?? '';
                            },
                          ),
                          SizedBox(height: 41),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AppButton(
                                title: 'Batalkan',
                                buttonColor: Colors.red,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              AppButton(
                                title: 'Simpan',
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 2,
          separatorBuilder: (context, index) {
            return SizedBox(height: 20);
          },
          itemBuilder: (context, index) {
            // var data = [index];
            return Padding(
              padding: EdgeInsets.only(
                // bottom: index == .length - 1 ? 100 : 0,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tiket Masuk Dewasa',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                'Nusantara',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: AppColor.greytext,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: Image.asset(AssetsConst.trashIcon),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        backgroundColor: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Hapus Data',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                              Text(
                                                'Apakah anda yakin untuk menghapus data ini ?',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  AppButton(
                                                    title: 'Batalkan',
                                                    buttonColor: Colors.red,
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  AppButton(
                                                    title: 'Hapus',
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              SizedBox(width: 15),
                              IconButton(
                                icon: Image.asset(AssetsConst.penIcon),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        backgroundColor: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 24,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('Nama'),
                                              SizedBox(height: 8),
                                              TextField(
                                                controller: ticketNameControler,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: 'Nama Tiket',
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Text('Harga'),
                                              SizedBox(height: 8),
                                              TextField(
                                                controller: priceController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: 'Harga Tiket',
                                                ),
                                              ),
                                              SizedBox(height: 40),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  AppButton(
                                                    title: 'Batalkan',
                                                    buttonColor: Colors.red,
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  AppButton(
                                                    title: 'Simpan',
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 13),
                      Text(
                        'Rp 50000',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
