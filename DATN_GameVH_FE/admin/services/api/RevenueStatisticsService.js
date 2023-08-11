app.factory("RevenueStatisticsService", function ($http) {
  const baseUrl = host + "/api/revenue";
  return {
    getRevenueByYear: function (year) {
      return $http.get(baseUrl + "/year/" + year);
    },
    getRevenueByTotalPriceForYear: function (year) {
      return $http.get(baseUrl + "/year/totalPrice/" + year);
    },
    getRevenueByMonthAndPaymentType: function (month) {
      return $http.get(baseUrl + "/month/paymentType/" + month);
    },
    getRevenueByMonthAndCategory: function (month) {
      return $http.get(baseUrl + "/month/category/" + month);
    }
  };
});
