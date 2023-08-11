app.controller('GoogleSigninController', function ($location, $window, GoogleService, AccountService, AuthorityService, SendMailService) {
    var currentUrl = $location.url();

    // Xử lý URL hiện tại với các tham số query
    if (currentUrl.includes('access_token')) {
        // Lấy access token từ URL
        var url = window.location.href;

        // Tìm vị trí của tham số 'access_token' trong chuỗi URL
        var start = url.indexOf('access_token=');
        if (start !== -1) {
            // Tìm vị trí của ký tự '&' tiếp theo sau tham số 'access_token'
            var end = url.indexOf('&', start);

            // Cắt chuỗi từ vị trí start+13 (độ dài của 'access_token=') đến end
            var accessToken = url.substring(start + 13, end);

            // Gửi yêu cầu HTTP tới Google API để lấy thông tin người dùng
            GoogleService.getUserInfo(accessToken).then(function (userInfo) {
                var user = userInfo.data;
                // Tạo account với thông tin từ email của người dùng và pass mặc định là 123
                var pasword = generateRandomPassword(8);
                var account = {
                    "username": user.email,
                    "password": pasword,
                    "fullname": user.name,
                    "email": user.email,
                    "photo": "19dn5AWG9uCVzTpVWBFCOVvzPRv-ZXJlc",
                    "type": "google",
                    "status": true,
                    "accessToken": generateUniqueAccessToken(32)
                }

                // Tạo account trên database với thông tin của email người dùng
                AccountService.createAccount(account).then(function (account) {
                    var account = account.data;
                    var auth = {
                        "account": account,
                        "role": {
                            "id": "CUST",
                            "name": "Người Dùng"
                        }
                    }
                    // Tạo role cho account 
                    AuthorityService.createAuthority(auth).then(function (authority) {
                    }).catch(function (error) {
                        console.error('Lỗi khi tạo role cho account:', error);
                    });

                    if (account.id != null) {
                        $window.sessionStorage.setItem("username", account.username);
                        // Trở về trang trước đó hoặc trang chủ nếu có lỗi
                        var pageBackLoginSuccess = ($window.sessionStorage.getItem("pageBackLoginSuccess") != null) ? $window.sessionStorage.getItem("pageBackLoginSuccess") : null;
                        if (pageBackLoginSuccess && !pageBackLoginSuccess.includes("login")) {
                            $window.location.href = pageBackLoginSuccess;
                        } else {
                            $window.location.href = "/";
                        }
                    } else {
                        // Kiểm tra nếu đã tồn tại username là email đó thì lấy ra
                        AccountService.getByUsername(account.email).then(function (accountByUsername) {
                            var accountData = accountByUsername.data;
                            if (accountData != null) {
                                $window.sessionStorage.setItem("username", accountData.username);

                                // Trở về trang trước đó hoặc trang chủ nếu có lỗi
                                var pageBackLoginSuccess = ($window.sessionStorage.getItem("pageBackLoginSuccess") != null) ? $window.sessionStorage.getItem("pageBackLoginSuccess") : null;
                                if (pageBackLoginSuccess && !pageBackLoginSuccess.includes("login")) {
                                    $window.location.href = pageBackLoginSuccess;
                                } else {
                                    $window.location.href = "/";
                                }
                            }
                        }).catch(function (error) {
                            console.error('Lỗi khi tìm account theo email:', error);
                        });

                        // Kiểm tra nếu đã tồn tại email đó thì lấy ra username
                        AccountService.getByEmail(account.email).then(function (accountByEmail) {
                            var accountDataEmail = accountByEmail.data;
                            if (accountDataEmail != null) {
                                $window.sessionStorage.setItem("username", accountDataEmail.username);
                            }
                        }).catch(function (error) {
                            console.error('Lỗi khi tìm account theo email:', error);
                            $window.location.href = 'login.html';
                        });
                    }
                }).catch(function (error) {
                    console.error('Lỗi khi thêm account:', error);
                    $window.location.href = 'login.html';
                });

            }).catch(function (error) {
                console.error('Lỗi khi lấy thông tin tài khoản gmail:', error);
                $window.location.href = 'login.html';
            });
        } else {
            console.log('Không tìm thấy access token trong URL');
        }
    }

    function generateUniqueAccessToken(length) {
        var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        var key = '';

        for (var i = 0; i < length; i++) {
            key += characters.charAt(Math.floor(Math.random() * characters.length));
        }

        // Tạo mã hash duy nhất từ chuỗi key
        var uniqueKey = CryptoJS.SHA256(key).toString(CryptoJS.enc.Hex);

        return uniqueKey;
    }

    function generateRandomPassword(length) {
        const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        let password = "";

        for (let i = 0; i < length; i++) {
            const randomIndex = Math.floor(Math.random() * charset.length);
            password += charset[randomIndex];
        }

        return password;
    }

});
