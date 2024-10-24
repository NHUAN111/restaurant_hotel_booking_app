import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_hotel_and_restaurants/configs/color.dart';
import 'package:my_hotel_and_restaurants/configs/routes/routes_name.dart';
import 'package:my_hotel_and_restaurants/utils/user_db.dart';
import 'package:my_hotel_and_restaurants/view/components/ProfileCardComponent.dart';
import 'package:my_hotel_and_restaurants/view_model/customer_view_model.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final customerProvider =
        Provider.of<CustomerViewModel>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/profile.png',
                  width: 100,
                  height: 140,
                ),
                Text(
                  customerProvider.customerModel.customer_name!,
                  style: const TextStyle(
                    fontSize: 18,
                    color: ColorData.myColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              height: 20,
              indent: 5,
              endIndent: 5,
            ),
            ProfileCardComponent(
              icon: Icon(
                Icons.account_box_rounded,
                color: ColorData.myColor,
              ),
              onPress: () {
                // Action for Personal Page
                Navigator.pushNamed(context, RoutesName.updateUserPage);
              },
              nameFuction: 'Personal Page',
            ),
            ProfileCardComponent(
              icon: Icon(Icons.favorite, color: ColorData.myColor),
              onPress: () {},
              nameFuction: 'Your Favorites',
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              height: 20,
              indent: 5,
              endIndent: 5,
            ),
            ProfileCardComponent(
              icon: Icon(
                Icons.logout_rounded,
                color: ColorData.myColor,
              ),
              onPress: () {
                // Action for Log Out
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutesName.login, (route) => false);
                CherryToast.success(title: Text("Đăng xuất thành công!"))
                    .show(context);
                CustomerDB.deleteCustomer();
              },
              nameFuction: 'Log Out',
            ),
          ],
        ),
      ),
    );
  }
}
