app.controller("LoginController", LoginController);
function LoginController($scope,$location,$window, LoginService, SweetAlert) {
    $scope.userName;
    $scope.password;
    $scope.fullName
    $scope.submitLogin = function () {
        LoginService.login({
            "userName":$scope.userName,
            "password":$scope.password
        })
        .then((response) => {
            SweetAlert.success("ĐĂNG NHẬP THÀNH CÔNG!", "");
            $window.localStorage.setItem("userName",response.data.username)
            $window.localStorage.setItem("photo",response.data.photo)
            $scope.fullName = response.data.username
            $location.path("/dashboard")
        })
        .catch((err) =>{
            SweetAlert.error("Sai thông tin đăng nhập"," Vui lòng thử lại!!!");
        });
    };

    $scope.logout = function(){
        $window.localStorage.removeItem("userName");
        $window.localStorage.removeItem("photo");
        $location.path("/")
    }
}
