app.factory('AuthorityService', function ($http) {
    var baseUrl = host + '/api/authority';

    return {
        createAuthority: function (data) {
            return $http.post(baseUrl + '/create', data);
        }
    };
});
