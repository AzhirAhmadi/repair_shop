import intel from "./intel";

export default {
  numberWithCommas(x){
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+" Toman";
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
