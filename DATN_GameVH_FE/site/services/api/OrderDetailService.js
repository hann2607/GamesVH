app.factory('OrderDetailService', function ($http) {
    var baseUrl = host + '/api/orderdetail';

    return {
        createOrderDetail: function (orderData) {
            return $http.post(baseUrl + '/create', orderData);
        },
        getByOrderDataId: function (orderDataId) {
            return $http.get(baseUrl + '/orderdata/' + orderDataId);
        }
    };
});
