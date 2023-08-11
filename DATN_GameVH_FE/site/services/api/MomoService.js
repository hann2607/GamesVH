app.factory('MomoService', function ($http) {
    var baseUrl = host + '/api/momo';

    return {
        createOrder: function (data) {
            return $http.post(baseUrl + '/create', data);
        },
        queryOrder: function (data) {
            return $http.post(baseUrl + '/query', data);
        }
    };
});
