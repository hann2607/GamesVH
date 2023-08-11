app.controller("CouponController", CouponController);

function CouponController($scope, CouponService, SweetAlert) {
  $scope.coupons = [];
  $scope.couponIdFilter;
  $scope.couponNameFilter;
  $scope.init = function () {
    CouponService.getAllBySearch({
      couponId : $scope.couponIdFilter,
      couponName : $scope.couponNameFilter})
      .then(function (response) {
        const data = response.data;
        $scope.coupons = data;
      })
      .catch(function (error) {
        console.error("Lỗi khi lấy danh sách danh mục:", error);
      });
  };

  $scope.selectCoupon = function (coupon) {
    $scope.formName = coupon.couponName;
    $scope.formId = coupon.id;
    $scope.formCode = coupon.code;
    $scope.formAmount = coupon.amount;
    $scope.formValue = coupon.value;
    $scope.formMinSpend = coupon.minSpend;
    $scope.formStatus = coupon.status ? "1":"2";
    $scope.formManufacturingDate = coupon.mfgDate;
    $scope.formExpiryDate = coupon.expDate;
    $scope.formDescription = coupon.description;
    $scope.formImg = coupon.image
    $scope.stepsModel.push("https://drive.google.com/uc?export=view&id="+coupon.image);
  };
  $scope.init();

  //   Form Handling
  $scope.formName;
  $scope.formId;
  $scope.formCode;
  $scope.formAmount;
  $scope.formValue;
  $scope.formMinSpend;
  $scope.formStatus;
  $scope.formManufacturingDate;
  $scope.formExpiryDate;
  $scope.formDescription;
  $scope.formImg


  $scope.openAddModal = function () {
    $scope.id= "";
    $scope.formName= "";
    $scope.formCode = "";
    $scope.formAmount = "";
    $scope.formValue = "";
    $scope.formMinSpend = "";
    $scope.formStatus = "";
    $scope.formManufacturingDate = "";
    $scope.formExpiryDate = "";
    $scope.formDescription = "";
    $scope.formImg="";
  };

  $scope.stepsModel = [];

  $scope.imageUpload = function(event){
    $scope.stepsModel = [];
    var files = event.target.files; //FileList object

    for (var i = 0; i < files.length; i++) {
        var file = files[i];
            var reader = new FileReader();
            reader.onload = $scope.imageIsLoaded; 
            reader.readAsDataURL(file);
    }
  }

  $scope.imageIsLoaded = function(e){
      $scope.$apply(function() {
          $scope.formImg= e.target.result
          $scope.stepsModel.push(e.target.result);
      });
  }
  $scope.submitAdd = function () {
    if (!$scope.formName || !$scope.formCode || !$scope.formMinSpend || !$scope.formStatus
      || !$scope.formManufacturingDate || !$scope.formExpiryDate || !$scope.formImg) {
      SweetAlert.info("Form không hợp lệ", "Vui lòng kiểm tra lại!!!");
      return;
    }
    CouponService.createCoupon({
      couponName : $scope.formName,
      id : $scope.formId,
      code : $scope.formCode,
      amount : $scope.formAmount,
      value : $scope.formValue,
      minSpend : $scope.formMinSpend,
      status : $scope.formStatus,
      mfgDate : $scope.formManufacturingDate,
      expDate : $scope.formExpiryDate,
      description : $scope.formDescription,
      image : $scope.formImg
    })
      .then((response) => {
        SweetAlert.success(
          "Thêm mã giảm giá thành công",
          `Mã giảm giá: Thêm thành công!`
        );
        $scope.init();
      })
      .catch((err) =>
        SweetAlert.error("Phát hiện có lỗi, Vui lòng thử lại!!!", "")
      );
  };

  $scope.getAllBySearch = function(){
    CouponService.getAllBySearch({
      couponId : $scope.couponIdFilter,
      couponName : $scope.couponNameFilter})
      .then(function (response) {
        const data = response.data;
        $scope.coupons = data;
      })
      .catch(function (error) {
        console.error("Lỗi khi lấy danh sách danh mục:", error);
      });
  }
  $scope.delete = function () {
    CouponService.deleteCoupon($scope.formId)
      .then((response) => {
        SweetAlert.success("Đã xóa!", "");
        $scope.init();
      })
      .catch((err) =>
        SweetAlert.error("Phát hiện có lỗi, Vui lòng thử lại!!!!", "")
      );
  };
}
