app.factory('BlogService', function ($http) {
    var baseUrl = host + '/api/blog';

    return {
        getAllBlog: function () {
            return $http.get(baseUrl + '/getAllBlog');
        },
        getTop4BlogPopular: function () {
            return $http.get(baseUrl + '/getTop4BlogPopular');
        },
        getBlogById: function (blogId) {
            return $http.get(baseUrl + '/getBlogDetail/' + blogId);
        },
    };
});