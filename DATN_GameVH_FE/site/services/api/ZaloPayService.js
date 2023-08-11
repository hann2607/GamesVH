app.factory('ZaloPayService', function ($http) {
    var baseUrl = host + '/api/zalopay';

    return {
        createPayment(data) {
            return $http.post(baseUrl + '/create', data);
        }
    };
});