import 'package:flutter/material.dart';
import 'package:robo4me/HomeScreen/homeScreen.dart';
import 'package:robo4me/appColors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final bottomTabs = [
    HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: bottomTabs[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.primaryColor,
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.primaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(Icons.home),
                    SizedBox(
                      height: 2,
                    ),
                    if (_currentIndex == 0)
                      Container(
                        height: 2,
                        width: 20,
                        color: Colors.white,
                      ),
                  ],
                ),
                label: "Home"),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Image.asset(
                    'assets/images/setting.png',
                    height: 20,
                    width: 20,
                  ),
                  if (_currentIndex == 1)
                    Container(
                      height: 2,
                      width: 20,
                      color: Colors.white,
                    ),
                ],
              ),
              label: "Filtered",
            ),
            BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/bottom_navigation_arrow.png',
                            height: 20,
                            width: 20,
                          ),
                        )),
                    if (_currentIndex == 2)
                      Container(
                        height: 2,
                        width: 20,
                        color: Colors.white,
                      ),
                  ],
                ),
                label: "up/down"),
            BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(Icons.account_balance_wallet_outlined),
                    if (_currentIndex == 3)
                      Container(
                        height: 2,
                        width: 20,
                        color: Colors.white,
                      ),
                  ],
                ),
                label: "wallet"),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Image.asset(
                    'assets/images/dashboard.png',
                    height: 20,
                    width: 20,
                  ),
                  if (_currentIndex == 4)
                    Container(
                      height: 2,
                      width: 20,
                      color: Colors.white,
                    ),
                ],
              ),
              label: "All",
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
