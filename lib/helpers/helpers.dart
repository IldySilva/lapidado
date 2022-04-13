import 'package:intl/intl.dart';

String currencyConverter(number){
  final oCcy = new NumberFormat("#,##0.00", "pt-PT");
  return oCcy.format(number) + " AOA";

}