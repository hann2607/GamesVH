app.controller("FeedbackWebsiteController", function (AccountService, FeedbackWebsiteService, SendMailService, ToastService, $scope, $window) {
    $scope.feedbackSubmit = function () {
        AccountService.checkLogin().then(function (account) {
            // Người dùng đã đăng nhập
            $scope.account = account;

            if ($scope.account) {
                if (!$scope.feedback.$invalid) {
                    // Lấy ngày hiện tại
                    var currentDate = new Date();

                    // Tạo các hàm phụ trợ để định dạng số thành chuỗi hai chữ số
                    function padZero(number) {
                        return number < 10 ? "0" + number : number;
                    }

                    // Định dạng ngày tháng
                    var year = currentDate.getFullYear();
                    var month = padZero(currentDate.getMonth() + 1);
                    var day = padZero(currentDate.getDate());
                    var hours = padZero(currentDate.getHours());
                    var minutes = padZero(currentDate.getMinutes());
                    var seconds = padZero(currentDate.getSeconds());

                    // Chuỗi định dạng "yyyy-MM-ddTHH:mm:ss"
                    var formattedDate = `${year}-${month}-${day}T${hours}:${minutes}:${seconds}`;

                    var feedbackData = {
                        "content": $scope.content,
                        "createDate": formattedDate,
                        "account": $scope.account
                    }
                    FeedbackWebsiteService.createFeedback(feedbackData).then(function (response) {
                        ToastService.showSuccessToast("Cảm ơn bạn đã đóng góp ý kiến để cải thiện website!");
                        // Gửi email
                        if ($scope.account.email) {
                            var mailInfo = {
                                "to": $scope.account.email,
                                "subject": "Thư cảm ơn!",
                                "body": ""
                            }
                            SendMailService.sendMailThanks($scope.account.username, mailInfo).then(function (mail) {
                            }).catch(function (error) {
                                console.error('Lỗi khi Gửi email!');
                            });
                        }
                    }).catch(function (error) {
                        ToastService.showErrorToast("Lỗi khi gửi góp ý!");
                    });
                }
            }
        }).catch(function (error) {
            // Người dùng chưa đăng nhập hoặc có lỗi
            console.error('Lỗi đăng nhập hoặc chưa đăng nhập:', error);
            if (error === "Người dùng chưa đăng nhập") {
                // Xử lý logic khi người dùng chưa đăng nhập
                $window.localStorage.removeItem("username");
                $window.sessionStorage.removeItem("username");
                $window.sessionStorage.setItem("messageLogin", "Vui lòng đăng nhập!");
                $window.location.href = 'login.html';
            }
        });
    }
});