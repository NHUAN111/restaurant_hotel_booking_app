import 'package:flutter/material.dart';
import 'package:my_hotel_and_restaurants/view/components/ButtonSelectComponent.dart';
import 'package:my_hotel_and_restaurants/view/components/CardHotelComponent.dart';
import 'package:my_hotel_and_restaurants/view/components/FilterComponent.dart';

class SearchHotelRestaurantScreen extends StatefulWidget {
  const SearchHotelRestaurantScreen({super.key});

  @override
  State<SearchHotelRestaurantScreen> createState() =>
      _SearchHotelRestaurantScreenState();
}

class _SearchHotelRestaurantScreenState
    extends State<SearchHotelRestaurantScreen> {
  int indexHotelType = 0;

  void _onApplyFilters() {
    // Implement your filter application logic here
    print("Filters applied");
    Navigator.of(context).pop(); // Close the modal after applying filters
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Scrollbar(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonSelectComponent(
                    index: 1,
                    hotelString: "Hotel",
                    width: 130,
                    selectedIndex: indexHotelType,
                    onTap: (index) {
                      setState(() {
                        indexHotelType = index;
                      });
                      showHotelFilter(context); // Show filter for hotels
                    },
                  ),
                  ButtonSelectComponent(
                    index: 2,
                    width: 130,
                    hotelString: "Restaurant",
                    selectedIndex: indexHotelType,
                    onTap: (index) {
                      setState(() {
                        indexHotelType = index;
                      });
                      showRestaurantFilter(
                          context); // Show filter for restaurants
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: HotelCard(
                      imageUrl:
                          'https://muongthanh.com/images/video/original/muong-thanh-luxury-quang-ninh-1_1681902050_1688035221.jpg',
                      hotelName: 'Hotel Name $index',
                      location: 'Location $index',
                      ranking: 4,
                      price: 1200.0,
                      onPressed: () {
                        print('Booking Hotel $index');
                      },
                      onFavoritePressed: () {
                        print('Favorited Hotel $index');
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showHotelFilter(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return FilterComponent(
        title: "Hotel Filter",
        sortOptions: ["Price", "Rating"],
        initialStarRating: 4,
        initialHotelType: "Khách sạn",
        initialMinPrice: 100,
        initialMaxPrice: 500,
        onApply: () {
          // Handle apply logic
        },
        showPriceRange: true, // Change to false to hide price range
        showHotelButtons: true, // Change to false to hide hotel buttons
      );
    },
  );
}

void showRestaurantFilter(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return FilterComponent(
        title: "Restaurant Filter",
        sortOptions: ["Price", "Rating"],
        initialStarRating: 4,
        initialHotelType: "Khách sạn",
        initialMinPrice: 100,
        initialMaxPrice: 500,
        onApply: () {
          // Handle apply logic
        },
        showPriceRange: false, // Change to false to hide price range
        showHotelButtons: false, // Change to false to hide hotel buttons
      );
    },
  );
}
