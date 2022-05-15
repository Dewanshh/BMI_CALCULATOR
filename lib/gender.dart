import 'input_page.dart';

enum Sex { male, female }
void updateColour(Sex gender) {
  if (gender == Sex.male) {
    if (malecardcolour == inactivecardcolor) {
      malecardcolour = activatecolor;
      print('Male is Selected');
      femalecardcolour = inactivecardcolor;
    } else
      malecardcolour = inactivecardcolor;
  } else if (gender == Sex.female) {
    if (femalecardcolour == inactivecardcolor) {
      femalecardcolour = activatecolor;
      print('Female is Selceted');
      malecardcolour = inactivecardcolor;
    } else
      femalecardcolour = inactivecardcolor;
  }
}
