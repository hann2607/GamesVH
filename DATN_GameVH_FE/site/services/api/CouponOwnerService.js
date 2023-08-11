app.factory('CouponOwnerService', function ($http) {
    var baseUrl = host + '/api/couponowner';

    return {
        getCoupon: function (username, couponcode) {
            return $http.get(baseUrl + '/getcoupon/' + username + "/" + couponcode);
        },
        getCouponByUsername: function (username) {
            return $http.get(baseUrl + '/getcoupon/username/' + username);
        }
    };
});
