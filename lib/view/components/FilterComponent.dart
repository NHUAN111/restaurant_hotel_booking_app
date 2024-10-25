import 'package:flutter/material.dart';
import 'package:my_hotel_and_restaurants/configs/color.dart';
import 'package:my_hotel_and_restaurants/view/components/ButtonSelectComponent.dart';

class FilterComponent extends StatefulWidget {
  final String title;
  final List<String> sortOptions;
  final int initialStarRating;
  final String initialHotelType;
  final double initialMinPrice;
  final double initialMaxPrice;
  final VoidCallback? onTabHotel1; // Nullable callback
  final VoidCallback? onTabHotel2; // Nullable callback
  final VoidCallback onApply;
  final bool showPriceRange; // New parameter
  final bool showHotelButtons; // New parameter

  const FilterComponent({
    Key? key,
    required this.title,
    required this.sortOptions,
    this.onTabHotel1,
    this.onTabHotel2,
    this.initialStarRating = 4,
    this.initialHotelType = 'Khách sạn',
    this.initialMinPrice = 100,
    this.initialMaxPrice = 500,
    required this.onApply,
    this.showPriceRange = true,
    this.showHotelButtons = true,
  }) : super(key: key);

  @override
  _FilterComponentState createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  late String _selectedSort;
  late double _currentMinPrice;
  late double _currentMaxPrice;
  late int _selectedStar;

  @override
  void initState() {
    super.initState();
    _selectedSort = widget.sortOptions.first;
    _currentMinPrice = widget.initialMinPrice;
    _currentMaxPrice = widget.initialMaxPrice;
    _selectedStar = widget.initialStarRating;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: ColorData.myColor,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Sort By',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          DropdownButton<String>(
            value: _selectedSort,
            icon: Icon(Icons.arrow_downward),
            isExpanded: true,
            onChanged: (String? newValue) {
              setState(() {
                _selectedSort = newValue!;
              });
            },
            items: widget.sortOptions
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          Text(
            'Hotel Ranking',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedStar = index + 1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: _selectedStar == index + 1
                        ? ColorData.myColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: _selectedStar == index + 1
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.star,
                        color: _selectedStar == index + 1
                            ? Colors.yellow
                            : Colors.grey,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 16),
          if (widget.showHotelButtons) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonSelectComponent(
                  index: 1,
                  hotelString: "Khách sạn",
                  selectedIndex: 1,
                  onTap: (p0) {
                    // Use null-aware operator
                    widget.onTabHotel1?.call();
                    print("1");
                  },
                ),
                ButtonSelectComponent(
                  index: 2,
                  hotelString: "Khu nghỉ dưỡng",
                  selectedIndex: 2,
                  onTap: (p0) {
                    // Use null-aware operator
                    print("2");
                    widget.onTabHotel2?.call();
                  },
                ),
              ],
            ),
          ],
          SizedBox(height: 16),
          if (widget.showPriceRange) ...[
            Text(
              'Price Ranges',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            RangeSlider(
              values: RangeValues(_currentMinPrice, _currentMaxPrice),
              min: 100,
              max: 1000,
              divisions: 10,
              activeColor: ColorData.myColor,
              labels: RangeLabels(
                '${_currentMinPrice.toStringAsFixed(0)}k',
                '${_currentMaxPrice.toStringAsFixed(0)}k',
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentMinPrice = values.start;
                  _currentMaxPrice = values.end;
                });
              },
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${_currentMinPrice.toStringAsFixed(0)}k'),
                Text('${_currentMaxPrice.toStringAsFixed(0)}k'),
              ],
            ),
          ],
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              widget.onApply(); // Call onApply without null check
              Navigator.pop(context); // Close the modal when applying
            },
            style: ElevatedButton.styleFrom(
              primary: ColorData.myColor,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'APPLY',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
