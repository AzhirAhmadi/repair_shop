import intel from "./intel";

String.prototype.toEnglishDigit = function() {
  var find = ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"];
  var replace = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
  var replaceString = this;
  var regex;
  for (var i = 0; i < find.length; i++) {
    regex = new RegExp(find[i], "g");
    replaceString = replaceString.replace(regex, replace[i]);
  }
  return replaceString;
};

export default {
  numberWithCommas(x){
    return intel.NumberFormat().format(x);
  },
  money(x) {
    return intel.MoneyFormat().format(x);
  },
  dateFromat(x) {
    var temp = x.split("T");
    var date = temp[0]
      .split("-")
      .concat(
        temp[1]
          .split("Z")[0]
          .split(".")[0]
          .split(":")
      )
      .map((x) => parseInt(x));
    return intel.DateTimeFormat().format(new Date(Date.UTC(...date)));
  },
};
