app.factory("CouponService", function ($http) {
  const baseUrl = host + "/api/coupon";
  return {
    getAllBySearch: function (filters) {
      const queries = {
        couponName: filters.couponName || null,
        couponId: filters.couponId || null,
      };
      return $http.post(baseUrl+"/getAllBySearch", queries);
    },
    createCoupon(coupon) {
      return $http.post(baseUrl+"/addCoupon", coupon);
    },
    deleteCoupon(id) {
      return $http.delete(`${baseUrl}/${id}`);
    },
  };
});
