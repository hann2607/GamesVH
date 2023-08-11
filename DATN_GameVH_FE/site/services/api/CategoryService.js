app.factory('CategoryService', function ($http) {
    var baseUrl = host + '/api/category';

    return {
        getAll: function () {
            return $http.get(baseUrl + '/getAll');
        },
        getAllProductByCategory: function (categoryId) {
            return $http.get(baseUrl + '/getProduct/' + categoryId);
        }
    };
});
