import 'package:flutter/material.dart';
import 'package:my_hotel_and_restaurants/configs/color.dart';

class ButtonSelectComponent extends StatelessWidget {
  final int index;
  final String hotelString;
  final int selectedIndex;
  final Function(int) onTap;

  const ButtonSelectComponent({
    Key? key,
    required this.index,
    required this.hotelString,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index); // Gọi callback khi button được nhấn
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: index == selectedIndex ? ColorData.myColor : Colors.white,
          borderRadius: BorderRadius.circular(60),
          border: Border.all(
              color: index == selectedIndex
                  ? Color.fromARGB(255, 154, 155, 156).withOpacity(0.4)
                  : const Color.fromRGBO(232, 234, 241, 1),
              width: 0.8),
        ),
        child: Text(
          hotelString,
          style: TextStyle(
            fontSize: 14,
            color: index == selectedIndex ? Colors.white : ColorData.myColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
