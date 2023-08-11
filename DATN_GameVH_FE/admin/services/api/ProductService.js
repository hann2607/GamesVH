app.factory("ProductService", function ($http) {
    const baseUrl = host + "/api/product";
    const baseUrlCommon = host + "/api/common";
    return {
      getTop5: function () {
        return $http.get(baseUrl + "/getTop5");
      },
      getTotalRecord: function () {
        return $http.get(baseUrlCommon);
      },
      getAllDataChart: function () {
        return $http.get(baseUrlCommon+"/getAllDataChart");
      },
    };
  });