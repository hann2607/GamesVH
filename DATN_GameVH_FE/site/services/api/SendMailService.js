app.factory('SendMailService', function ($http) {
    var baseUrl = host + '/api/mail';

    return {
        sendMailCheckout: function (orderId, mailInfo) {
            return $http.post(baseUrl + '/send/checkout/' + orderId, mailInfo);
        },
        sendMailRegister: function (username, password, mailInfo) {
            return $http.post(baseUrl + '/send/register/' + username + "/" + password, mailInfo);
        },
        sendMailThanks: function (username, mailInfo) {
            return $http.post(baseUrl + '/send/thanks/' + username, mailInfo);
        }
    };
});
