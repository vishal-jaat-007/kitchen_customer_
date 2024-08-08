import 'package:tiffin_service_customer/view_model/enums/enums.dart';

class TimeSlot {
  final String period;
  final MealCategory category;
  final List<String> slots;

  TimeSlot({required this.period, required this.slots, required this.category});
}

final List<TimeSlot> timeSlots = [
  TimeSlot(
    period: 'Morning',
    category: MealCategory.BREAKFAST,
    slots: ['08:00 - 08:30', '09:00 - 09:30', '10:00 - 11:30'],
  ),
  TimeSlot(
    period: 'Afternoon',
    category: MealCategory.LUNCH,
    slots: ['08:00 - 08:30', '09:00 - 09:30', '10:00 - 11:30'],
  ),
  TimeSlot(
    period: 'Evening',
    category: MealCategory.DINNER,
    slots: ['08:00 - 08:30', '09:00 - 09:30', '10:00 - 11:30'],
  ),
];
