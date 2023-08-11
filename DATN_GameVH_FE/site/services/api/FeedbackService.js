app.factory('FeedbackService', function ($http) {
    var baseUrl = host + '/api/feedback';

    return {
        getFeedbackByProduct: function (productId) {
            return $http.get(baseUrl + '/getProduct/' + productId);
        },
        getFeedbackByUsernameAndProductId: function (username, productId) {
            return $http.get(baseUrl + '/getProductByUsernameAndProductId/' + username + '/' + productId);
        },
        addOrUpdateFeedback: function (username, productId, feedback) {
            return $http.put(baseUrl + '/addOrUpdate/' + username + '/' + productId, feedback);
        }
    };
});
