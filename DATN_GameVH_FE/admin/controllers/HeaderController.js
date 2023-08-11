app.controller("HeaderController", HeaderController);
function HeaderController($scope,$window,$location, SweetAlert) {
    $scope.fullName
    $scope.photo
    $scope.init = function(){
        $scope.fullName  = $window.localStorage.getItem("userName")
        $scope.photo  = $window.localStorage.getItem("photo")
    }
    $scope.init()
    $scope.logout = function(){
        debugger
        $window.localStorage.removeItem("userName");
        $window.localStorage.removeItem("photo");
        $location.path("/")
    }
}
