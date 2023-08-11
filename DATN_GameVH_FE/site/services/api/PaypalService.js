app.factory('PaypalService', function ($http) {
    var baseUrl = host + '/api/paypal';

    return {
        createPaypalOrder: function (data) {
            return $http.post(baseUrl + '/create', data);
        },
        getOrder: function (orderId) {
            return $http.get(baseUrl + '/' + orderId + '/capture');
        }
    };
});
