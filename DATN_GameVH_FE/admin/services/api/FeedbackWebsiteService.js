app.factory("FeedbackWebsiteService", function ($http) {
  const baseUrl = host + "/api/feedbackwebsite";
  return {
    getAll: function () {
      return $http.get(baseUrl + "/getAll");
    }
  };
});
