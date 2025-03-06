import 'package:eticket_flutter_app/core/app_color.dart';
import 'package:eticket_flutter_app/core/assets.const.dart';
import 'package:eticket_flutter_app/ui/home/history_screen.dart';
import 'package:eticket_flutter_app/ui/home/home_screen.dart';
import 'package:eticket_flutter_app/ui/home/setting_screen.dart';
import 'package:eticket_flutter_app/ui/home/ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        selectedItemColor: AppColor.mainColor,
        unselectedItemColor: AppColor.grey,
        currentIndex: currentPage,
        onTap:
            (index) => setState(() {
              currentPage = index;
            }),
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(AssetsConst.activeHomeIcon),
            icon: Image.asset(AssetsConst.homeIcon),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(AssetsConst.activeTicketIcon),
            icon: SvgPicture.asset(AssetsConst.ticketIcon),
            label: 'Ticket',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AssetsConst.scanIcon),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(AssetsConst.activeHistoryIcon),
            icon: SvgPicture.asset(AssetsConst.historyIcon),
            label: 'History',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(AssetsConst.activeSettingIcon),
            icon: SvgPicture.asset(AssetsConst.settingIcon),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  List screen = [
    HomeScreen(),
    TicketScreen(),
    TicketScreen(),
    HistoryScreen(),
    SettingScreen(),
  ];
}
