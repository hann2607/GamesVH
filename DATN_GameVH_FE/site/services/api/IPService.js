app.factory('IPService', function ($http) {
    return {
        getIPAddress: function () {
            return $http.get('https://api.ipify.org?format=json');
        }
    }
});