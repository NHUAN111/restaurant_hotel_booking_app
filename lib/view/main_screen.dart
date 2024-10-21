import 'package:flutter/material.dart';
import 'package:my_hotel_and_restaurants/configs/color.dart';
import 'package:my_hotel_and_restaurants/main_test.dart';
import 'package:my_hotel_and_restaurants/utils/user_db.dart';
import 'package:my_hotel_and_restaurants/view/favourite/favourite_page.dart';
import 'package:my_hotel_and_restaurants/view/myorder/my_order_page.dart';
import 'package:my_hotel_and_restaurants/view/profile/profile_page.dart';
import 'package:my_hotel_and_restaurants/view_model/customer_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List loadedPages = [0];

  @override
  Widget build(BuildContext context) {
    final customerViewModel =
        Provider.of<CustomerViewModel>(context, listen: true);
    var screens = [
      HotelScreen(),
      loadedPages.contains(1) ? const MyOrderPage() : Container(),
      loadedPages.contains(2) ? const FavouritePage() : Container(),
      loadedPages.contains(3) ? const ProfilePage() : Container(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            left: 15, right: 15, bottom: 10), // Padding to position it higher
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Soft shadow
                spreadRadius: 5,
                blurRadius: 15,
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorData.myColor,
            unselectedItemColor: Color.fromARGB(255, 192, 192, 192),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              var pages = loadedPages;
              if (!pages.contains(index)) {
                pages.add(index);
              }
              setState(() {
                _currentIndex = index;
                if (_currentIndex == 3) {
                  customerViewModel.setCustomerModel(CustomerDB.getCustomer()!);
                }
                loadedPages = pages;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 2.0),
                  child: Icon(
                    Icons.home,
                    size: 28,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 2.0),
                  child: Icon(
                    Icons.hotel,
                    size: 28,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 2.0),
                  child: Icon(
                    Icons.beach_access_rounded,
                    size: 28,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 2.0),
                  child: Icon(
                    Icons.person,
                    size: 28,
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
