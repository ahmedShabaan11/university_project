class RegexManager{
  // static const locatinUrlRegex = "^https?:\/\/www.google.com\/maps\/";
  static const phoneRegex="^(002)?01[0125][0-9]{8}\$";
  static const stringRegex='(^[A-z][A-z]{2,}\$|^[\u0621-\u064A]{2,}\$)';
  static const emailRegex='(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+\$)';
  static const countRegex="[1-9]";
  static const nationalIdRegex="^[0-9]{14}\$";
  static const priceRegex="^(0|[1-9]|[1-9][0-9]{1,})\$";
}
