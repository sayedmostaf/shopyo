import 'package:shopyo/core/service/shared_pref/pref_keys.dart';
import 'package:shopyo/core/service/shared_pref/shared_pref.dart';

class FontFamilyHelper {
  const FontFamilyHelper._();
  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';

  static String getLocalizedFontFamily() {
    final currentLanguage = SharedPref().getString(PrefKeys.language);
    return currentLanguage == 'ar' ? cairoArabic : poppinsEnglish;
  }
}
