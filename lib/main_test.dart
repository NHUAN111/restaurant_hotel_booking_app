import 'package:flutter/material.dart';
import 'package:my_hotel_and_restaurants/configs/color.dart';
import 'package:my_hotel_and_restaurants/configs/routes/routes_name.dart';
import 'package:my_hotel_and_restaurants/view/components/ButtonSelectComponent.dart';
import 'package:my_hotel_and_restaurants/view/components/CardHotelComponent.dart';
import 'package:my_hotel_and_restaurants/view/components/CardOrderHotelComponent.dart';
import 'package:my_hotel_and_restaurants/view/components/CardRestaurantComponent.dart';
import 'package:my_hotel_and_restaurants/view/components/HotelCompontent.dart';
import 'package:my_hotel_and_restaurants/view/components/MenuComponent.dart';

class HotelScreen extends StatefulWidget {
  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  int indexHotelType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 510,
              child: Stack(
                children: [
                  Container(
                    height: 350, // Adjust the height as needed
                    decoration: BoxDecoration(
                      color: ColorData.myColor, // Pink color
                      // borderRadius: BorderRadius.vertical(
                      //   bottom: Radius.circular(30),
                      // ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50), // For status bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello, Nguyenvinh",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Ngu Hanh Son",
                                      style: TextStyle(
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Card(
                              elevation: 10,
                              shape: CircleBorder(),
                              child: IconButton(
                                icon: Icon(Icons.notifications_none),
                                color: ColorData.myColor,
                                iconSize: 30,
                                onPressed: () {
                                  print("search");
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        // Search bar
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.search),
                                color: Colors.grey,
                                iconSize: 30,
                                onPressed: () {
                                  print("search");
                                },
                              ),
                              Text(
                                "Search your hotel...",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        // Popular Hotel Title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Popular Hotel 🔥",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                print("see all");
                              },
                              child: Text(
                                'See All',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 240, // Adjust the position
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 275, // Adjust the height as needed
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5, // Number of hotels
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: HotelCard(
                              imageUrl:
                                  'https://muongthanh.com/images/video/original/muong-thanh-luxury-quang-ninh-1_1681902050_1688035221.jpg',
                              hotelName: 'Hotel Name $index',
                              location: 'Location $index',
                              ranking: 4,
                              price: 1200.0,
                              onPressed: () {
                                print('booking $index');
                              },
                              onFavoritePressed: () {
                                print('fav $index');
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Restaurant Favorite",
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorData.myColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print("see all");
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 12, 146, 255),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250, // Adjust the height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Number of restaurants
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RestaurantCard(
                      imageUrl:
                          'https://muongthanh.com/images/video/original/muong-thanh-luxury-quang-ninh-1_1681902050_1688035221.jpg',
                      location: 'Location $index',
                      ranking: 4,
                      restaurantName: 'Restaurant $index',
                      onFavoritePressed: () {
                        print('fav $index');
                      },
                      onBookingPressed: () {
                        print('booking $index');
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ButtonSelectComponent(
                    index: 0,
                    hotelString: "Khách Sạn",
                    selectedIndex: indexHotelType,
                    onTap: (index) {
                      setState(() {
                        indexHotelType = index;
                      });
                      print("index khach san");
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 5, // Number of restaurants
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: RestaurantCard(
                              imageUrl:
                                  'https://muongthanh.com/images/video/original/muong-thanh-luxury-quang-ninh-1_1681902050_1688035221.jpg',
                              location: 'Location $index',
                              ranking: 4,
                              restaurantName: 'Restaurant $index',
                              onFavoritePressed: () {
                                print('fav $index');
                              },
                              onBookingPressed: () {
                                print('booking $index');
                              },
                            ),
                          );
                        },
                      );
                      // hotelViewModel.fetchHotelListByType(type: index);
                    },
                  ),
                  ButtonSelectComponent(
                    index: 1,
                    hotelString: "Khu Nghỉ Dưỡng",
                    selectedIndex: indexHotelType,
                    onTap: (index) {
                      setState(() {
                        indexHotelType = index;
                      });
                      print("index khu nghi duong");
                      // hotelViewModel.fetchHotelListByType(type: index);
                    },
                  ),
                  ButtonSelectComponent(
                    index: 2,
                    hotelString: "Nhà Hàng",
                    selectedIndex: indexHotelType,
                    onTap: (index) {
                      setState(() {
                        indexHotelType = index;
                      });
                      print("index nha hang");
                      // hotelViewModel.fetchHotelListByType(type: index);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            HotelComponent(
              imageUrl:
                  'https://muongthanh.com/images/video/original/muong-thanh-luxury-quang-ninh-1_1681902050_1688035221.jpg',
              hotelName: 'Restaurantssssssssssss',
              location: 'Da Nang',
              price: 3442222,
              onPressed: () {
                print('booking');
              },
            ),
            SizedBox(
              height: 20,
            ),
            MenuComponent(
              imageUrl:
                  'https://beptueu.vn/hinhanh/tintuc/top-15-hinh-anh-mon-an-ngon-viet-nam-khien-ban-khong-the-roi-mat-1.jpg',
              nameMeal: "Bánh mỳ",
              price: 23444,
            ),
            SizedBox(
              height: 20,
            ),
            CardOrderComponent(
              hotelName: "Mường thanh Luxury",
              imageUrl:
                  'https://muongthanh.com/images/video/original/muong-thanh-luxury-quang-ninh-1_1681902050_1688035221.jpg',
              orderDate: "08-10-2024/09-10-2024",
              viewType: "Hướng sông",
              person: 3,
              rooms: 2,
              price: 2.5000000,
              status: "complted",
              check: true,
              onPressed: () {
                print("detail");
              },
            ),
            CardOrderComponent(
              hotelName: "Mường thanh Luxury",
              imageUrl:
                  'https://muongthanh.com/images/video/original/muong-thanh-luxury-quang-ninh-1_1681902050_1688035221.jpg',
              orderDate: "08-10-2024/09-10-2024",
              viewType: "Hướng sông",
              person: 3,
              rooms: 2,
              price: 2.5000000,
              status: "complted",
              onPressed: () {
                print("detail");
              },
              check: false,
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
