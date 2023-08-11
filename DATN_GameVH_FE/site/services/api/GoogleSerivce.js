app.factory('GoogleService', function ($http) {
    var baseUrl = 'https://www.googleapis.com/oauth2/v3';

    return {
        getUserInfo: function (accessToken) {
            return $http.get(baseUrl + '/userinfo?access_token=' + accessToken);
        }
    };
});
