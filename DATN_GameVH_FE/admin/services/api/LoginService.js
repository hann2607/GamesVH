app.factory("LoginService", function ($http) {
    const baseUrl = host + "/api/login";
    return {
      login: function (user) {
        return $http.post(baseUrl,user);
      }
    };
  });
  