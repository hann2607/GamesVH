app.controller("CustomerController", CustomerController);

function CustomerController($scope, AccountService, SweetAlert) {
  $scope.customers = [];
  $scope.pageNo = 0;
  $scope.pageSize = 10;
  $scope.nameFilter = "";
  $scope.emailFilter = "";
  $scope.init = function () {
    getPage(0);
  };
  $scope.init();

  $scope.filterData = function () {
    getPage(0);
  };

  function getPage(page) {
    AccountService.getCustomers({
      page: page,
      size: $scope.size,
      email: $scope.emailFilter,
      name: $scope.nameFilter,
      roleId: "CUST",
    })
      .then(function (response) {
        const data = response.data;
        $scope.customers = data.content;
        $scope.pageNo = data.pageNumber;
      })
      .catch(function (error) {
        console.error("Lỗi khi lấy danh sách nhân viên:", error);
      });
  }
  $scope.toggleAccountStatus = function (account) {
    AccountService.toggleStatus(account.username).then(function (response) {
      SweetAlert.success(
        "Trạng thái hoạt động của tài khoản",
        `Trạng thái: ${response.data.status ? "Đang hoạt động" : "Không hoạt động"}`
      );
      $scope.init();
    });
  };
}
