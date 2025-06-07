import 'package:flutter/material.dart';
import 'package:rec_ball/Methods/generating_dates.dart';
import 'package:intl/intl.dart';

class DatesBar extends StatefulWidget {
  final Function(DateTime selectedDate)? onDateSelected;
  const DatesBar({super.key, this.onDateSelected});

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
      final initialIndex = _dates.indexWhere(
        (date) =>
            date.year == _selectedDate!.year &&
            date.month == _selectedDate!.month &&
            date.day == _selectedDate!.day,
      );
      if (initialIndex != -1) {
        _scrollController.scrollTo(
          index: initialIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _scrollController.jumpTo(
          _scrollController.position.maxScrollExtent / 2,
        );
      }

      if (widget.onDateSelected != null && _selectedDate != null) {
        widget.onDateSelected!(_selectedDate!);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String formateDate(DateTime date) {
    final today = DateTime.now().toLocal();
    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return "Today";
    }
    return DateFormat("EEE dd MMM").format(date);
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
      height: 70,
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
                if(widget.onDateSelected != null){
                  widget.onDateSelected!(date);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isSelected ? Color(0xffC3E71E) : Color(0xffF4F4F4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                foregroundColor: Colors.black,
              ),
              child: Text(formattedDate, style: TextStyle(fontSize: 20)),
            ),
          );
        },
      ),
    );
  }
}

extension ScrollControllerExtension on ScrollController {
  void scrollTo({
    required int index,
    required Duration duration,
    required Curve curve,
  }) {
    if (!hasClients) return;
    final double itemWidth = 100.0;
    final double offset =
        index * itemWidth - (position.viewportDimension / 2) + (itemWidth / 2);
    animateTo(
      offset.clamp(position.minScrollExtent, position.maxScrollExtent),
      duration: duration,
      curve: curve,
    );
  }
}
