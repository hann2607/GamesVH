app.controller("CouponOwnerController", CouponOwnerController);

function CouponOwnerController($scope, CouponOwnerService,CouponService,AccountService, SweetAlert) {
  $scope.couponOwners = [];
  $scope.customerNameFilter;
  $scope.couponNameFilter;
  $scope.totalMoneyFilter;
  $scope.locationFilter;
  $scope.coupons = [];
  $scope.accounts = [];
  $scope.couponId;
  $scope.accountId;
  $scope.couponOwnerId;
  $scope.image;
  $scope.init = function () {
    CouponService.getAllBySearch({
      couponId : null,
      couponName : null})
      .then(function (response) {
        const data = response.data;
        $scope.coupons = data;
      })
      .catch(function (error) {
        console.error("Lỗi khi lấy danh sách danh mục:", error);
      });
    AccountService.getEmployees({
      page:0,
      size:1000
    })
      .then(function (response) {
        const data = response.data;
        $scope.accounts = data.content;
      })
      .catch(function (error) {
        console.error("Lỗi khi lấy danh sách nhân viên:", error);
      });
    CouponOwnerService.getAllBySearch({  customerName:$scope.customerNameFilter,
      couponName:$scope.couponNameFilter,
      totalMoney :$scope.totalMoneyFilter,
      location :$scope.locationFilter})
      .then(function (response) {
        const data = response.data;
        $scope.couponOwners = data;
      })
      .catch(function (error) {
        console.error("Lỗi khi lấy danh sách danh mục:", error);
      });
  };
  $scope.selectCouponOwner = function (couponOwner) {
    debugger
    $scope.couponId = couponOwner.couponId +'';
    $scope.accountId = couponOwner.accountId + '';
    $scope.couponOwnerId = couponOwner.id;
    $scope.image = couponOwner.image;
  };
  $scope.init();
  $scope.getAllBySearch = function(){
    CouponOwnerService.getAllBySearch({  customerName:$scope.customerNameFilter,
      couponName:$scope.couponNameFilter,
      totalMoney :$scope.totalMoneyFilter,
      location :$scope.locationFilter})
      .then(function (response) {
        const data = response.data;
        $scope.couponOwners = data;
      })
      .catch(function (error) {
        console.error("Lỗi khi lấy danh sách danh mục:", error);
      });
  }
  
  $scope.openAddModal = function(){
    CouponService.getAllBySearch({
      couponId : null,
      couponName : null})
      .then(function (response) {
        const data = response.data;
        $scope.coupons = data;
      })
      .catch(function (error) {
        console.error("Lỗi khi lấy danh sách danh mục:", error);
      });
    AccountService.getEmployees({
      page:0,
      size:1000
    })
      .then(function (response) {
        const data = response.data;
        $scope.accounts = data.content;
      })
      .catch(function (error) {
        console.error("Lỗi khi lấy danh sách nhân viên:", error);
      });
  }

  $scope.changeSelectCoupon = function(){
    $scope.image = $scope.coupons.filter(s=>{
      return Number($scope.couponId) === s.id
    })[0]?.image
  }

  $scope.submitAdd = function(){
    if (!$scope.couponId || !$scope.accountId ) {
      SweetAlert.info("Form không hợp lệ", "Vui lòng kiểm tra lại!!!");
      return;
    }
    CouponOwnerService.createCouponOwner({
      couponId : $scope.couponId,
      accountId : $scope.accountId,
      couponOwnerId : $scope.couponOwnerId
    })
      .then((response) => {
        SweetAlert.success(
          "Đã thêm mã giảm giá cho khách hàng",
          `Mã giảm giá cho khách hàng: Thêm thành công!`
        );
        $scope.init();
      })
      .catch((err) =>
        SweetAlert.error("Phát hiện có lỗi, Vui lòng thử lại!!!", "")
      );
  }

  $scope.delete = function () {
    CouponOwnerService.deleteCouponOwner($scope.couponOwnerId)
      .then((response) => {
        SweetAlert.success("Đã xóa!", "");
        $scope.init();
      })
      .catch((err) =>
        SweetAlert.error("Phát hiện có lỗi, Vui lòng thử lại!!!", "")
      );
  };
}



