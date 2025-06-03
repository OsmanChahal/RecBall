import 'package:flutter/material.dart';
import 'package:rec_ball/Methods/generating_dates.dart';

class DatesBar extends StatefulWidget {
  const DatesBar({super.key});

  @override
  State<DatesBar> createState() => _DatesBar();
}

class _DatesBar extends State<DatesBar> {
  List<DateTime> _dates = [];
  DateTime? _selectedDate;

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _dates = generatingDateRang();
    _selectedDate = DateTime.now().toLocal();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent / 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      height: 80,
      width: double.infinity,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: _dates.length,
        itemBuilder: (context, index) {
          final date = _dates[index];
          final formattedDate = formatDate(date);
          final isSelected =
              _selectedDate != null &&
              date.year == _selectedDate!.year &&
              date.month == _selectedDate!.month &&
              date.day == _selectedDate!.day;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedDate = date;
                });
              },
              child: Text(
                formattedDate,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isSelected ? Color(0xffC3E71E) : Color(0xffF4F4F4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
