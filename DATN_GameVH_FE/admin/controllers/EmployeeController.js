app.controller("EmployeeController", EmployeeController);
function EmployeeController($scope, AccountService, SweetAlert) {
  // Gọi API để lấy danh sách nhân viên
  $scope.employees = [];
  $scope.pageNo = 0;
  $scope.pageSize = 2;
  $scope.nameFilter = "";
  $scope.usernameFilter = "";

  $scope.totalItems = 1000;

  $scope.employeeForm;
  $scope.image;
  $scope.errorForm;
  $scope.init = function () {
    $scope.employeeForm = {
      id: null,
      username: "",
      password: "",
      rePassword: "",
      fullName: "",
      email: "",
    };
    getPage(0);
  };
  $scope.init();

  $scope.openAddModal = function () {
    resetFormError();
    $scope.employeeForm = {
      id: null,
      username: "",
      password: "",
      rePassword: "",
      fullName: "",
      email: "",
    };
  };
  const checkIfImage = (url, callback) => {
    const img = new Image();
    img.src = url;

    if (img.complete) callback();

    img.onload = () => {
      if (this.width) callback();
      else callback(false);
    };
    img.onerror = () => {};
  };

  $scope.submitAdd = function () {
    if (!checkFormError()) {
      SweetAlert.error("Form không hợp lệ", "Vui lòng kiểm tra lại!!!");
      return;
    }
    delete $scope.employeeForm.rePassword;
    delete $scope.employeeForm.id;
    AccountService.createEmployee($scope.employeeForm, $scope.image)
      .then((response) => {
        SweetAlert.success("Thêm nhân viên mới thành công!!!", "");
        $scope.init();
      })
      .catch((err) =>
        SweetAlert.error("Có lỗi xảy ra!", "Vui lòng thử lại!!")
      );
  };

  $scope.handleFileChange = function (event) {
    $scope.image = event.target.files[0];
    const imageURL = URL.createObjectURL($scope.image);

    // Set the source of the <img> element
    const imgElement = document.getElementById("add_staff_image");
    imgElement.src = imageURL;
    $scope.$apply();
  };

  $scope.handleUpdateImage = function (event) {
    $scope.image = event.target.files[0];
    const imageURL = URL.createObjectURL($scope.image);

    // Set the source of the <img> element
    const imgElement = document.getElementById("update_staff_image");
    imgElement.src = imageURL;
    $scope.$apply();
  };

  $scope.selectEmployee = function (employee) {
    resetFormError();
    $scope.employeeForm = {
      id: employee.id,
      username: employee.username,
      password: "",
      rePassword: "",
      fullName: employee.fullname,
      email: employee.email,
    };
    const image = `https://drive.google.com/uc?id=${employee.photo}`;
    checkIfImage(image, () => {
      const imgElement = document.getElementById("update_staff_image");
      imgElement.src = image;
      $scope.$apply();
    });
  };
  $scope.toggleAccountStatus = function (account) {
    AccountService.toggleStatus(account.username).then(function (response) {
      SweetAlert.success(
        "Trạng thái hoạt động của tài khoản",
        `Trạng thái: ${response.data.status ? "Đang hoạt động" : "Không hoạt động"}`
      );
      $scope.init();
    });
  };
  $scope.submitEdit = function () {
    if (!checkFormError()) {
      SweetAlert.error("Form không hợp lệ", "Vui lòng kiểm tra lại!!!");
      return;
    }
    delete $scope.employeeForm.rePassword;
    delete $scope.employeeForm.id;
    AccountService.updateEmployee(
      $scope.employeeForm.username,
      $scope.employeeForm,
      $scope.image
    )
      .then((response) => {
        SweetAlert.success("Cập nhật thành công!!!", "");
        $scope.init();
      })
      .catch((err) =>
        SweetAlert.error("Có lỗi xảy ra!", "Vui lòng thử lại!!")
      );
  };

  function resetFormError() {
    $scope.errorForm = {
      id: { message: "", touched: false },
      username: { message: "", touched: false },
      password: { message: "", touched: false },
      rePassword: { message: "", touched: false },
      fullName: { message: "", touched: false },
      email: { message: "", touched: false },
    };
  }

  $scope.filterData = function () {
    getPage(0);
  };
  $scope.pageChangeHandler = function (newPageNumber) {
    getPage(newPageNumber - 1);
  };

  function getPage(page) {
    AccountService.getEmployees({
      page: page,
      size: $scope.size,
      username: $scope.usernameFilter,
      name: $scope.nameFilter,
      roleId: "STAF",
    })
      .then(function (response) {
        const data = response.data;
        $scope.employees = data.content;
        $scope.pageNo = data.pageNumber;
        //   $scope.employees = response.data;
      })
      .catch(function (error) {
        console.error("Lỗi khi lấy danh sách nhân viên:", error);
      });
  }

  function checkFormError() {
    const form = $scope.employeeForm;
    if (
      !form.username ||
      !form.password ||
      !form.rePassword ||
      !form.fullName ||
      !form.email
    ) {
      return false;
    }
    if (form.password != form.rePassword) return false;
    return true;
  }
}
