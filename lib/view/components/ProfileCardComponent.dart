import 'package:flutter/material.dart';
import 'package:my_hotel_and_restaurants/configs/color.dart';

class ProfileCardComponent extends StatefulWidget {
  final Icon icon;
  final String nameFuction;
  final VoidCallback onPress;

  const ProfileCardComponent({
    Key? key,
    required this.icon,
    required this.onPress,
    required this.nameFuction,
  }) : super(key: key);

  @override
  State<ProfileCardComponent> createState() => _ProfileCardComponentState();
}

class _ProfileCardComponentState extends State<ProfileCardComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        onTap: () {
          widget.onPress();
        },
        child: Card(
          elevation: 4,
          shadowColor: Colors.black12,
          child: ListTile(
            leading: widget.icon,
            title: Text(
              widget.nameFuction,
              style: TextStyle(
                color: ColorData.textHotelMain,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: ColorData.myColor,
            ),
          ),
        ),
      ),
    );
  }
}
