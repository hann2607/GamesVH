app.factory('ProductService', function ($http) {
    var baseUrl = host + '/api/product';

    return {
        getProductDTO: function (productId) {
            return $http.get(baseUrl + '/getProductDTO/' + productId);
        },
        getProduct: function (productId) {
            return $http.get(baseUrl + '/' + productId);
        },
        getAllProductDTO: function () {
            return $http.get(baseUrl + '/getAllProductDTO');
        },
        getAllProductDTOByType: function (type) {
            return $http.get(baseUrl + '/getAllProductDTO/' + type);
        },
        getAllProductDTOByTypeAndCategory: function (type, category) {
            return $http.get(baseUrl + '/getAllProductDTO/' + type + '/' + category);
        },
        getTop6Selling: function () {
            return $http.get(baseUrl + '/topselling');
        },
        getTop6NewRelease: function () {
            return $http.get(baseUrl + '/newrelease');
        },
        getTop6Rated: function () {
            return $http.get(baseUrl + '/toprate');
        },
        getListGame: function () {
            return $http.get(baseUrl + '/getListGame');
        },
        getListAccessory: function () {
            return $http.get(baseUrl + '/getListAccessory');
        }
    };
});
