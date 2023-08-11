app.factory('OrderService', function ($http) {
    var baseUrl = host + '/api/orderdata';

    return {
        createOrder: function (data) {
            return $http.post(baseUrl + '/create', data);
        },
        getByUsername: function (username) {
            return $http.get(baseUrl + '/search/' + username);
        },
        getById: function (orderId) {
            return $http.get(baseUrl + '/' + orderId);
        }
    };
});
