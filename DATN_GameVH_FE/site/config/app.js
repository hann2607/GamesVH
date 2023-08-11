let host = "http://localhost:8080";
// Angular js 
var app = angular.module("app", ["ngRoute", "ngSanitize"]).filter('striptags', function () {
    return function (input) {
        if (!input) return input;
        if (angular.isString(input)) {
            return input.replace(/<[^>]+>/gm, '');
        }
        return input;
    }
});
