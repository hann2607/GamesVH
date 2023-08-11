app.factory('FeedbackWebsiteService', function ($http) {
    var baseUrl = host + '/api/feedbackwebsite';

    return {
        createFeedback: function (feedback) {
            return $http.post(baseUrl + '/create', feedback);
        }
    };
});
