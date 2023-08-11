app.factory('VNPayService', function ($http) {
    var baseUrl = host + '/api/vnpay';
    return {
        createOrder: function (totalPrice, userIP) {
            return $http.get(baseUrl + '/create/' + totalPrice + '/' + userIP);
        }
    }
});