app.factory("CouponOwnerService", function ($http) {
  const baseUrl = host + "/api/couponowner";
  return {
    getAllBySearch: function (filters) {
      return $http.post(baseUrl+"/getAllBySearch", filters);
    },
    createCouponOwner(couponOwner) {
      return $http.post(baseUrl+"/addCouponOwner", couponOwner);
    },
    deleteCouponOwner(id) {
      return $http.delete(`${baseUrl}/${id}`);
    },
  };
});
