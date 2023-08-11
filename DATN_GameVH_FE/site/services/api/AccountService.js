app.factory('AccountService', function ($http, $window, $q, $location, $route) {
    var baseUrl = host + '/api/account';

    return {
        checkLogin: function () {
            var deferred = $q.defer(); // Tạo deferred object
            var username = null;

            // Kiểm tra xem người dùng đã đăng nhập hay chưa
            username = $window.localStorage.getItem("username") || $window.sessionStorage.getItem("username");

            // Kiểm tra xem URL cần kiểm tra có trong các link đã được khai báo trong route hay không
            var isDeclaredRoute = false;

            // Lấy URL cần kiểm tra
            var urlToCheck = $location.path();

            // Lặp qua các route đã khai báo
            angular.forEach($route.routes, function (route) {
                // Kiểm tra xem URL cần kiểm tra có trùng khớp với route hay không
                if (route.originalPath && route.regexp && route.regexp.test(urlToCheck)) {
                    isDeclaredRoute = true;
                }
            });

            // Nếu link trươc khi login không chứa "login" và là link đã khai báo trong route thì sẽ dùng link đó nếu không thì dùng link trang home
            if (!$window.location.href.includes("login") && isDeclaredRoute) {
                $window.sessionStorage.setItem("pageBackLoginSuccess", $window.location.href);
            } else {
                var pageBackLoginSuccess = ($window.sessionStorage.getItem("pageBackLoginSuccess") != null) ? $window.sessionStorage.getItem("pageBackLoginSuccess") : null;
                if (!pageBackLoginSuccess || pageBackLoginSuccess.includes("login")) {
                    $window.sessionStorage.setItem("pageBackLoginSuccess", $location.absUrl().split('/')[2]);
                }
            }

            // Kiểm tra nếu đã đăng nhập, gọi API lấy thông tin account
            if (username) {
                this.getByUsername(username)
                    .then(function (response) {
                        var account = response.data;
                        deferred.resolve(account); // Trả về account khi thành công
                    })
                    .catch(function (error) {
                        console.error('Lỗi khi lấy thông tin tài khoản:', error);
                        deferred.reject(error); // Trả về lỗi khi không thành công
                    });
            } else {
                deferred.reject("Người dùng chưa đăng nhập"); // Trả về lỗi khi chưa đăng nhập
            }

            return deferred.promise; // Trả về promise
        },
        getByUsername: function (username) {
            return $http.get(baseUrl + '/' + username);
        },
        getByEmail: function (email) {
            return $http.get(baseUrl + '/email/' + email);
        },
        createAccount: function (user) {
            return $http.post(baseUrl + '/create', user);
        },
        updateAccount: function (user) {
            return $http.put(baseUrl + '/update', user);
        },
        uploadImage: function (imageFile) {
            return $http.post(baseUrl + '/upload', imageFile, {
                headers: {
                    'Content-Type': undefined
                }
            });
        },
        changePassword: function (user) {
            return $http.put(baseUrl + '/changePassword', user);
        }

    };
});
