class FontFamilyHelper {
  const FontFamilyHelper._();
  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';

  static String getLocalizedFontFamily() {
    // TODO: SharedPreferences
    final currentLanguage = 'ar';
    return currentLanguage == 'ar' ? cairoArabic : poppinsEnglish;
  }
}
