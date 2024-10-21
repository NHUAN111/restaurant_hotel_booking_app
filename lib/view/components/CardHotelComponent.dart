import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_hotel_and_restaurants/configs/color.dart';
import 'package:my_hotel_and_restaurants/configs/text_style.dart';
import 'package:my_hotel_and_restaurants/view/components/BookingButton.dart'; // Đảm bảo bạn đã định nghĩa CustomButton ở đây
import 'FavouriteButtonComponent.dart';

class HotelCard extends StatefulWidget {
  final String imageUrl;
  final String hotelName;
  final String location;
  final int ranking;
  final double price;
  final VoidCallback onFavoritePressed; // New callback for favorite button
  final VoidCallback onPressed; // Thêm tham số onPressed

  const HotelCard({
    Key? key,
    required this.imageUrl,
    required this.hotelName,
    required this.location,
    required this.ranking,
    required this.price,
    required this.onPressed,
    required this.onFavoritePressed, // Nhận onPressed trong constructor
  }) : super(key: key);

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  child: Image.network(
                    widget.imageUrl,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                FavoriteButton(
                  onPressed: widget.onFavoritePressed, // Use the callback
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Rating and Price in one line
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.solidStar,
                          size: 15,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.ranking.toString(),
                          style: MyTextStyle.textStyle(
                            fontSize: 15,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(height: 0),
                        children: [
                          TextSpan(
                            text: "${widget.price} đ",
                            style: MyTextStyle.textStyle(
                              fontSize: 15,
                              color: ColorData.myColor,
                            ),
                          ),
                          TextSpan(
                            text: " /night",
                            style: MyTextStyle.textStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          MyTextStyle.truncateString(widget.hotelName, 20),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: ColorData.myColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.location,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    BookingButton(
                      onPressed:
                          widget.onPressed, // Sử dụng onPressed từ widget
                      text: "Booking",
                      color: ColorData.myColor,
                      icon: FontAwesomeIcons.plus,
                      textColor: Colors.white,
                      isIcon: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
