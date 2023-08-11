// Angular js
app.controller("MyAccount", function($scope, $http) {
    $scope.form = {};
    $scope.orderDetail = [];
    $scope.totalPrice = 0;
    $scope.username = document.getElementById("AccountID").innerText;

    // Get Account infomation
    $scope.getAccount = function() {
        var url = `${host}/account/${$scope.username}`;
        $http.get(url).then(resp => {
            $scope.form = resp.data;
        }).catch(error => {
            console.log("Error", error);
        });
    }
    $scope.getAccount();

    // update Account
    $scope.update = function(username) {
        $scope.messageSuccess = "";
        $scope.messageFailed = "";
        // Import bcrypt library
        const bcrypt = dcodeIO.bcrypt;
        if ($scope.newPass == null || $scope.newPass == undefined || $scope.newPass == "") {
            // doesn't update password
            if ($scope.confirmPass != undefined && $scope.confirmPass != "" && $scope.confirmPass != null) {
                if (bcrypt.compareSync($scope.confirmPass, $scope.form.password)) {
                    var fileInput = document.getElementById("fileInput");
                    var files = fileInput.files;
                    var form = new FormData();
                    form.append("files", files[0]);
                    // Check create image in folder
                    if (fileInput.value) {
                        var url = `${host}/files/users`;
                        $http.post(url, form, {
                            transformRequest: angular.identity,
                            headers: { "Content-Type": undefined }
                        }).then(resp => {
                            // create image success and update user on DB
                            var item = angular.copy($scope.form);
                            item.photo = resp.data.toString();
                            var url = `${host}/account/${username}`;
                            $http.put(url, item).then(resp => {
                                $scope.form = resp.data;
                                $scope.messageSuccess = "Cập nhật thông tin thành công!";
                            }).catch(error => {
                                console.log("Error", error);
                                $scope.messageFailed = "Cập nhật thông tin thất bại!";
                            });
                        }).catch(error => {
                            $scope.messageFailed = "Vui lòng chọn lại Avatar!";
                        });
                    } else {
                        var item = angular.copy($scope.form);
                        var url = `${host}/account/${username}`;
                        $http.put(url, item).then(resp => {
                            $scope.form = resp.data;
                            $scope.messageSuccess = "Cập nhật thông tin thành công!";
                        }).catch(error => {
                            console.log("Error", error);
                            $scope.messageFailed = "Cập nhật thông tin thất bại!";
                        });
                    }
                } else {
                    $scope.messageFailed = "Sai confirm current password!";
                }
            }
        } else {
            // Update new password
            // Check confirm current password and current password
            if ($scope.confirmPass != undefined && $scope.confirmPass != "" && $scope.confirmPass != null) {
                if (bcrypt.compareSync($scope.confirmPass, $scope.form.password)) {
                    // Check confirm new password and new password
                    if ($scope.newPass == $scope.confirmNewPass) {
                        var fileInput = document.getElementById("fileInput");
                        var files = fileInput.files;
                        var form = new FormData();
                        form.append("files", files[0]);
                        // Check create image in folder
                        if (fileInput.value) {
                            var url = `${host}/files/users`;
                            $http.post(url, form, {
                                transformRequest: angular.identity,
                                headers: { "Content-Type": undefined }
                            }).then(resp => {
                                // create image success and update user on DB
                                const salt = bcrypt.genSaltSync(10);
                                const newPass = bcrypt.hashSync($scope.newPass, salt);

                                var item = angular.copy($scope.form);
                                item.photo = resp.data.toString();
                                item.password = newPass;
                                var url = `${host}/account/${username}`;
                                $http.put(url, item).then(resp => {
                                    $scope.form = resp.data;
                                    $scope.messageSuccess = "Cập nhật thông tin thành công!";
                                }).catch(error => {
                                    console.log("Error", error);
                                    $scope.messageFailed = "Cập nhật thông tin thất bại!";
                                });
                            }).catch(error => {
                                $scope.messageFailed = "Vui lòng chọn lại Avatar!";
                            });
                        } else {
                            const salt = bcrypt.genSaltSync(10);
                            const newPass = bcrypt.hashSync($scope.newPass, salt);

                            var item = angular.copy($scope.form);
                            item.password = newPass;
                            var url = `${host}/account/${username}`;
                            $http.put(url, item).then(resp => {
                                $scope.form = resp.data;
                                $scope.messageSuccess = "Cập nhật thông tin thành công!";
                            }).catch(error => {
                                console.log("Error", error);
                                $scope.messageFailed = "Cập nhật thông tin thất bại!";
                            });
                        }
                    } else {
                        $scope.messageFailed = "Sai confirm new password!";
                    }
                } else {
                    $scope.messageFailed = "Sai confirm current password!";
                }
            }
        }
    }

    // Show modal order details
    $scope.showModal = function(orderId) {
        $('#modalDetailOrder').modal('show');
        var url = `${host}/orders/${orderId}`;
        $http.get(url).then(resp => {
            $scope.orderDetail = resp.data;
            $scope.totalPrice = 0;
            for (let i = 0; i < $scope.orderDetail.length; i++) {
                $scope.totalPrice += $scope.orderDetail[i].price;
            }
        }).catch(error => {
            console.log("Error", error);
        });
    }

    // format curency --> VND: 1,234.012
    $scope.formatCurrency = function(n) {
        var parts = n.toString().split(".");
        const numberPart = parts[0];
        const decimalPart = parts[1];
        const thousands = /\B(?=(\d{3})+(?!\d))/g;
        return numberPart.replace(thousands, ".") +
            (decimalPart ? "," + decimalPart : "");
    }
});