app.factory('BcryptService', function ($http) {
    var baseUrl = host + '/api/bcrypt';

    return {
        compare: function (data, encryptData) {
            return $http.get(baseUrl + '/compare?string=' + data + '&encryptedString=' + encryptData);
        }
    };
});
