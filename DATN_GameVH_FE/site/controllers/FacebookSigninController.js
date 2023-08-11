function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
    if (response.status === 'connected') {   // Logged into your webpage and Facebook.
        testAPI();
    }
}

function checkLoginState() {               // Called when a person is finished with the Login Button.
    FB.getLoginStatus(function (response) {   // See the onlogin handler
        statusChangeCallback(response);
    });
}

window.fbAsyncInit = function () {
    FB.init({
        appId: '239944008587219',
        cookie: true,                     // Enable cookies to allow the server to access the session.
        xfbml: true,                     // Parse social plugins on this webpage.
        version: 'v17.0'           // Use this Graph API version for this call.
    });


    FB.getLoginStatus(function (response) {   // Called after the JS SDK has been initialized.
        statusChangeCallback(response);        // Returns the login status.
    });
};

function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
    FB.api('/me', function (response) {
        // Sử dụng createAccount()
        var password = generateRandomPassword(8);
        var account = {
            "username": response.id,
            "password": password,
            "fullname": response.name,
            "email": null,
            "photo": "19dn5AWG9uCVzTpVWBFCOVvzPRv-ZXJlc",
            "type": "facebook",
            "status": true,
            "accessToken": generateUniqueAccessToken(32)
        }

        createAccount(account);
    });
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

function createAccount(user) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", host + '/api/account/create');
    xhr.setRequestHeader("Content-Type", "application/json");

    xhr.onload = function () {
        if (xhr.status === 200) {
            var account = JSON.parse(xhr.responseText);
            var auth = {
                "account": account,
                "role": {
                    "id": "CUST",
                    "name": "Người Dùng"
                }
            }

            createAuthority(auth)

            window.sessionStorage.setItem("username", account.username);

            // Trở về trang trước đó hoặc trang chủ nếu có lỗi
            var pageBackLoginSuccess = (window.sessionStorage.getItem("pageBackLoginSuccess") != null) ? window.sessionStorage.getItem("pageBackLoginSuccess") : null;
            if (pageBackLoginSuccess && !pageBackLoginSuccess.includes("login")) {
                window.location.href = pageBackLoginSuccess;
            } else {
                window.location.href = "/";
            }
        } else {
            console.error("Lỗi khi tạo tài khoản:", xhr.statusText);
        }
    };

    xhr.onerror = function () {
        console.error("Lỗi khi tạo tài khoản");
    };

    xhr.send(JSON.stringify(user));
}

function createAuthority(auth) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", host + '/api/authority/create');
    xhr.setRequestHeader("Content-Type", "application/json");

    xhr.onload = function () {
        if (xhr.status === 200) {
            var authority = JSON.parse(xhr.responseText);
        } else {
            console.error("Lỗi khi tạo role cho tài khoản:", xhr.statusText);
        }
    };

    xhr.onerror = function () {
        console.error("Lỗi khi tạo role cho tài khoản");
    };

    xhr.send(JSON.stringify(auth));
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