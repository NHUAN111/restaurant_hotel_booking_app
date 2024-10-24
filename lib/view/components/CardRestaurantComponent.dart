import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_hotel_and_restaurants/configs/color.dart';
import 'package:my_hotel_and_restaurants/configs/text_style.dart';
import 'package:my_hotel_and_restaurants/view/components/BookingButton.dart';

import 'FavouriteButtonComponent.dart';

class RestaurantCard extends StatefulWidget {
  final String imageUrl;
  final String restaurantName;
  final String location;
  final int ranking;
  final VoidCallback onFavoritePressed; // New callback for favorite button
  final VoidCallback onBookingPressed; // New callback for booking button

  const RestaurantCard({
    Key? key,
    required this.imageUrl,
    required this.restaurantName,
    required this.location,
    required this.ranking,
    required this.onFavoritePressed, // Add this line
    required this.onBookingPressed, // Add this line
  }) : super(key: key);

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
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
                    height: 130,
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
                // Rating in one line
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
                          MyTextStyle.truncateString(widget.restaurantName, 15),
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
                      onPressed: widget.onBookingPressed, // Use the callback
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
