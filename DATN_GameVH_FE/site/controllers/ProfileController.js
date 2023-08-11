app.controller("ProfileController", function (AccountService, LocationService, OrderService, OrderDetailService,
    CouponOwnerService, ToastService, PageService, BcryptService, FeedbackService, $scope, $window, $http, $timeout) {
    $scope.account = {}; // Biến lưu thông tin account 
    $scope.username = null;
    $scope.orders = [];
    $scope.order = {};
    $scope.coupons = [];
    $scope.driveImage = "https://drive.google.com/uc?id=";
    $scope.locationForm = {};
    $scope.locations = [];

    // Location
    const hostLocation = "https://provinces.open-api.vn/api/";
    $scope.selectedDistrict = false;
    $scope.selectedWard = false;
    $scope.provinces = [];
    $scope.districts = [];
    $scope.wards = [];
    var provinceId;
    var wardId;
    var districtId;
    $scope.location = {};


    /*----CHECK LOGIN----*/
    // Trở về trang đăng nhập
    $scope.logout = function () {
        $window.localStorage.removeItem("username");
        $window.sessionStorage.removeItem("username");
        $window.sessionStorage.setItem("messageLogin", "Bạn đã đăng xuất!");
        $window.location.href = 'login.html';
    };

    AccountService.checkLogin().then(function (account) {
        // Người dùng đã đăng nhập
        $scope.account = account;
        if ($scope.account) {
            $scope.currentPhotoUrl = $scope.account.photo ? $scope.driveImage + $scope.account.photo : $scope.driveImage + '1k7mZ306aaQltWZVJBe-zbXizg2NmAogx';

            LocationService.getByUsername($scope.account.username).then(function (location) {
                $scope.locations = location.data;
            }).catch(function (error) {
                console.error('Lỗi khi lấy location:', error);
            });

            OrderService.getByUsername($scope.account.username).then(function (order) {
                $scope.orders = order.data;
                if ($scope.orders) {
                    $scope.orders.account = null;
                    $scope.orders.sort(function (a, b) {
                        return new Date(b.createDate).getTime() - new Date(a.createDate).getTime();
                    });
                    $scope.getListOrderOnPage();
                }
            }).catch(function (error) {
                console.error('Lỗi khi lấy danh sách order:', error);
            });

            CouponOwnerService.getCouponByUsername($scope.account.username).then(function (coupon) {
                $scope.coupons = coupon.data;
                $scope.getListCouponOnPage();
            }).catch(function (error) {
                console.error('Lỗi khi lấy list coupon:', error);
            });
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

    /*----END CHECK LOGIN----*/

    /*----IMAGE----*/
    // Hàm xử lý sự kiện khi click vào nút "upload-button".
    $scope.handleUploadClick = function () {
        // Lấy ra input file-upload thông qua ID.
        var fileInput = document.getElementById('fileInput');
        // Khi click vào nút "upload-button", kích hoạt sự kiện click cho input file-upload.
        fileInput.click();
    };

    // Đăng ký sự kiện change cho input file-upload để xử lý khi người dùng chọn ảnh và thực hiện upload.
    document.getElementById('fileInput').addEventListener('change', function () {
        // Lấy danh sách các file đã chọn từ input file-upload.
        var selectedFiles = this.files;
        if (selectedFiles.length > 0) {
            // Lấy file đầu tiên trong danh sách (vì input file-upload cho phép multiple selection).
            $scope.selectedFile = selectedFiles[0];
            // Tạo một đường dẫn tạm thời cho ảnh từ file đã chọn.
            var tempPhotoUrl = URL.createObjectURL($scope.selectedFile);
            $scope.$apply(function () {
                // Cập nhật đường dẫn mới vào biến "currentPhotoUrl" để thay đổi ảnh hiển thị.
                $scope.currentPhotoUrl = tempPhotoUrl;
            });
        }
    });
    /*----END IMAGE----*/

    /*----RATING----*/
    $scope.stars = [
        { filled: false },
        { filled: false },
        { filled: false },
        { filled: false },
        { filled: false }
    ];

    $scope.currentRating = 0;

    $scope.setRating = function (star) {
        // Đánh giá sao khi người dùng nhấp vào
        var index = $scope.stars.indexOf(star);
        for (var i = 0; i < $scope.stars.length; i++) {
            $scope.stars[i].filled = i <= index;
        }

        // Cập nhật thông tin đánh giá hiện tại
        $scope.currentRating = index + 1;

        // Cập nhật trạng thái ngôi sao dựa vào currentRating
        $scope.updateStars();
    };

    $scope.updateStars = function () {
        for (var i = 0; i < $scope.stars.length; i++) {
            $scope.stars[i].filled = i < $scope.currentRating;
        }
    };

    $scope.hoverStar = function (star) {
        // Đánh giá sao khi người dùng di chuột qua
        var index = $scope.stars.indexOf(star);
        for (var i = 0; i <= index; i++) {
            $scope.stars[i].hovered = true;
        }
        for (var i = index + 1; i < $scope.stars.length; i++) {
            $scope.stars[i].hovered = false;
        }
    };

    $scope.resetHover = function () {
        // Reset trạng thái khi di chuột ra khỏi đánh giá
        for (var i = 0; i < $scope.stars.length; i++) {
            $scope.stars[i].hovered = false;
        }
    };

    // Gọi hàm cập nhật trạng thái ngôi sao khi giá trị currentRating thay đổi
    $scope.updateStars();
    /*----END RATING----*/

    /*----FEEDBACK----*/
    // Mở tab feedback
    $scope.feedback = {};
    $scope.openTabFeedBack = function (event, productId, productName) {
        $scope.productFeedbackName = productName;
        if (productId) {
            $scope.productFeedbackId = productId;
            document.getElementById("tabTitleFeedback").removeAttribute("hidden");
            document.getElementById("tabFeedback").removeAttribute("hidden");
            $scope.changeTab(event, "feedback");

            FeedbackService.getFeedbackByUsernameAndProductId($scope.account.username, productId).then(function (response) {
                $scope.feedback = response.data;
                if ($scope.feedback) {
                    $scope.currentRating = $scope.feedback.star;
                    $scope.updateStars();
                    $scope.buttonFeedback = "CHỈNH SỬA ĐÁNH GIÁ";
                } else {
                    $scope.feedback = {};
                    $scope.currentRating = 0;
                    $scope.updateStars();
                    $scope.buttonFeedback = "ĐÁNH GIÁ";
                    $scope.feedback.content = "";
                    $scope.feedback.star = 0;
                }
            }).catch(function (error) {
                console.error('Lỗi khi lấy product feedback');
            });
        }
    }

    $scope.feedbackSubmit = function () {
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

        $scope.feedback.createDate = formattedDate;
        $scope.feedback.status = false;
        $scope.feedback.star = $scope.currentRating;

        FeedbackService.addOrUpdateFeedback($scope.account.username, $scope.productFeedbackId, $scope.feedback).then(function (response) {
            $scope.fb = response.data;
            if ($scope.fb) {
                ToastService.showSuccessToast($scope.buttonFeedback.charAt(0).toUpperCase() + $scope.buttonFeedback.slice(1).toLowerCase() + " sản phẩm thành công!");
            } else {
                ToastService.showErrorToast($scope.buttonFeedback.charAt(0).toUpperCase() + $scope.buttonFeedback.slice(1).toLowerCase() + " sản phẩm thất bại!");
            }
        }).catch(function (error) {
            ToastService.showErrorToast($scope.buttonFeedback.charAt(0).toUpperCase() + $scope.buttonFeedback.slice(1).toLowerCase() + " sản phẩm thất bại!");
        });
    }

    /*----FEEDBACK----*/

    /*----CHANGE TAB----*/
    // Change tab điều hướng
    $scope.selectedTab = 'tab-dashboard';

    $scope.changeTabRedirect = function (tab) {
        // Cập nhật tab đang được chọn khi người dùng nhấn vào tab
        $scope.selectedTab = tab;
    };

    // Change tab Modal
    $scope.activeTab = 'order'; // Đặt tab mặc định là "Thông tin đơn hàng"

    $scope.changeTab = function (event, tabName) {
        if (!(tabName == "feedback")) {
            document.getElementById("tabTitleFeedback").setAttribute("hidden", true);
            document.getElementById("tabFeedback").setAttribute("hidden", true);
        }

        event.preventDefault(); // Ngăn chặn sự kiện mặc định khi click vào tab
        $scope.activeTab = tabName; // Cập nhật tab đang được chọn
    };
    /*----END CHANGE TAB----*/

    /*----SUBMIT FORM ACCOUNT----*/
    $scope.accountInfoSubmit = function () {

        if (!$scope.accountInfo.$invalid) {
            $scope.locations.forEach(location => {
                location.account = $scope.account;
            });

            if ($scope.selectedFile) {
                var formData = new FormData();
                var modifiedFileName = $scope.account.username;
                formData.append('image', $scope.selectedFile, modifiedFileName);
                AccountService.uploadImage(formData).then(function (image) {
                    $scope.image = image.data;
                    if ($scope.image) {
                        $scope.account.photo = $scope.image.fileId;
                        AccountService.updateAccount($scope.account).then(function (userInfo) {
                            $scope.user = userInfo.data;
                            if ($scope.user) {
                                LocationService.createOrUpdate($scope.locations).then(function (locations) {
                                    ToastService.showSuccessToast("Cập nhật thông tin thành công!");
                                }).catch(function (error) {
                                    console.error('Lỗi khi update location:', error);
                                });
                            }
                        }).catch(function (error) {
                            console.error('Lỗi khi update account:', error);
                        });
                    }
                }).catch(function (error) {
                    console.error('Lỗi khi up avatar lên drive:', error);
                });
            } else {
                AccountService.updateAccount($scope.account).then(function (userInfo) {
                    $scope.user = userInfo.data;
                    if ($scope.user) {
                        LocationService.createOrUpdate($scope.locations).then(function (locations) {
                            ToastService.showSuccessToast("Cập nhật thông tin thành công!");
                        }).catch(function (error) {
                            console.error('Lỗi khi update location:', error);
                        });
                    }
                }).catch(function (error) {
                    console.error('Lỗi khi update account:', error);
                });
            }
        }
    }

    /*----END SUBMIT FORM ACCOUNT----*/

    /*----SUBMIT FORM CHANGE PASSWORD----*/
    $scope.formPasword = {};
    $scope.passwordMatchError = false;

    $scope.changePassSubmit = function () {
        $scope.checkPasswordMatch();

        var formElement = document.getElementById('changePassForm');
        if (formElement.checkValidity() && $scope.passwordMatchError === false) {
            // Biểu mẫu hợp lệ, tiến hành xử lý
            AccountService.getByUsername($scope.account.username).then(function (user) {
                $scope.user = user.data; // Thông tin user từ Server
                if ($scope.user != null && $scope.user != undefined && $scope.user != "") {
                    // So sánh password người dùng nhập với password đã mã hóa 
                    BcryptService.compare($scope.formPasword.password, $scope.user.password).then(function (isComparePassword) {
                        if (!$scope.user.status) {
                            $window.localStorage.removeItem("username");
                            $window.sessionStorage.removeItem("username");
                            $window.sessionStorage.setItem("messageLogin", "Tài khoản này đã bị khóa!");
                            $window.location.href = 'login.html';
                        } else if (!isComparePassword.data) {
                            // So sánh password người dùng nhập với password đã mã hóa
                            // Nếu không đúng thì xuất lỗi
                            $scope.isValidCurrentPass = true;
                            $scope.CurrentPassError = "Mật khẩu không đúng!";
                        } else if ($scope.user.role != "CUST") {
                            // Kiểm tra quyền của người dùng có phải là CUST hay không ?
                            $window.localStorage.removeItem("username");
                            $window.sessionStorage.removeItem("username");
                            $window.sessionStorage.setItem("messageLogin", "Bạn không có quyền truy cập trang này!");
                            $window.location.href = 'login.html';
                        } else {
                            var accountChangePass = $scope.account;
                            accountChangePass.password = $scope.formPasword.newPass;
                            AccountService.changePassword(accountChangePass).then(function (account) {
                                $window.localStorage.removeItem("username");
                                $window.sessionStorage.removeItem("username");
                                $window.sessionStorage.setItem("messageLoginSuccess", "Đổi mật khẩu thành công vui lòng đăng nhập lại!");
                                $window.location.href = 'login.html';
                            }).catch(function (error) {
                                ToastService.showSuccessToast("Đổi mật khẩu thất bại!");
                            });
                        }
                    }).catch(function (error) {
                        $scope.isValidCurrentPass = true;
                        $scope.CurrentPassError = "Mật khẩu không đúng!";
                    });
                } else {
                    $window.localStorage.removeItem("username");
                    $window.sessionStorage.removeItem("username");
                    $window.sessionStorage.setItem("messageLogin", "Vui lòng đăng nhập lại để sử dụng chức năng!");
                    $window.location.href = 'login.html';
                }
            }).catch(function (error) {
                $window.localStorage.removeItem("username");
                $window.sessionStorage.removeItem("username");
                $window.sessionStorage.setItem("messageLogin", "Vui lòng đăng nhập lại để sử dụng chức năng!");
                $window.location.href = 'login.html';
            });
        }
    }

    $scope.checkPasswordMatch = function () {
        if ($scope.formPasword.newPass !== $scope.formPasword.confirmPass) {
            $scope.passwordMatchError = true;
        } else {
            $scope.passwordMatchError = false;
        }
    };

    $scope.currentPassChange = function () {
        $scope.isValidCurrentPass = false;
        $scope.CurrentPassError = "";
    }
    /*----END SUBMIT FORM CHANGE PASSWORD----*/

    /*----MODAL----*/
    $scope.fillDataModal = function (locationIndex, type) {
        $('#address-modal').modal('show');
        $scope.clearModal();

        $scope.addressForm.address.$touched = false;
        $scope.addressForm.phone.$touched = false;
        $scope.addressForm.province.$touched = false;
        $scope.addressForm.district.$touched = false;
        $scope.addressForm.ward.$touched = false;

        function clickHandlerAdd() {
            $scope.$apply(function () {
                if ($scope.addressForm.$invalid) {
                    $scope.addressForm.address.$touched = true;
                    $scope.addressForm.phone.$touched = true;
                    $scope.addressForm.province.$touched = true;
                    $scope.addressForm.district.$touched = true;
                    $scope.addressForm.ward.$touched = true;
                } else {
                    printResult();
                    $scope.locationForm.address = document.getElementById("inputAddress").value;
                    $scope.locationForm.address += ", " + $scope.selectedLocation;
                    $scope.locationForm.addressDefault = document.getElementById("addressDefaultModal").checked;

                    if ($scope.locations.length <= 0) {
                        $scope.locations = [];
                    } else {
                        $scope.locations[0].addressDefault = !(document.getElementById("addressDefaultModal").checked);
                    }
                    $scope.locations.push($scope.locationForm);
                    $scope.clearModal();
                    $('#address-modal').modal('hide');
                }
            });
        }

        function clickHandlerEdit() {
            $scope.$apply(function () {
                if ($scope.addressForm.$invalid) {
                    $scope.addressForm.address.$touched = true;
                    $scope.addressForm.phone.$touched = true;
                    $scope.addressForm.province.$touched = true;
                    $scope.addressForm.district.$touched = true;
                    $scope.addressForm.ward.$touched = true;
                } else {
                    printResult();
                    $scope.locationForm.address = document.getElementById("inputAddress").value;
                    $scope.locationForm.address += ", " + $scope.selectedLocation;
                    if (locationIndex >= 0) {
                        for (let i = 0; i < $scope.locations.length; i++) {
                            if (i != locationIndex) {
                                $scope.locations[i].addressDefault = !$scope.locationForm.addressDefault;
                                if ($scope.locationForm.type == "Nhà Riêng") {
                                    $scope.locations[i].type = "Văn Phòng";
                                } else {
                                    $scope.locations[i].type = "Nhà Riêng";
                                }
                            } else {
                                $scope.locations[i] = $scope.locationForm;
                            }
                        }
                    }

                    $scope.clearModal();
                    $('#address-modal').modal('hide');
                }
            });
        }

        if (type == "add") {
            $scope.title = "THÊM ĐỊA CHỈ MỚI";
            $scope.button = "THÊM";
            $scope.clearModal();
            if ($scope.locations.length > 0) {
                if ($scope.locations[0].type == "Nhà Riêng") {
                    $scope.locationForm.type = "Văn Phòng";
                } else {
                    $scope.locationForm.type = "Nhà Riêng";
                }
                document.getElementById("addressDefaultModal").disabled = false;
            } else {
                $scope.locationForm.type = "Nhà Riêng";
                document.getElementById("addressDefaultModal").disabled = true;
                $scope.locationForm.addressDefault = true;
            }
            document.getElementById("typeAddressModal").disabled = true;
            // Thêm sự kiện click
            document.getElementById('changeAddress').addEventListener('click', clickHandlerAdd);
        } else {
            $scope.title = "CHỈNH SỬA ĐỊA CHỈ";
            $scope.button = "THAY ĐỔI";
            document.getElementById("typeAddressModal").disabled = false;
            document.getElementById("addressDefaultModal").disabled = false;
            if ($scope.locations.length > 0) {
                if ($scope.locations.length > 1) {
                    document.getElementById("addressDefaultModal").disabled = false;
                } else {
                    document.getElementById("addressDefaultModal").disabled = true;
                }
                if (locationIndex >= 0) {
                    for (let i = 0; i < $scope.locations.length; i++) {
                        if (i == locationIndex) {
                            if ($scope.locations[i].id) {
                                $scope.locationForm.id = $scope.locations[i].id;
                            }
                            $scope.locationForm.addressDefault = $scope.locations[i].addressDefault;
                            $scope.locationForm.address = $scope.locations[i].address;
                            $scope.locationForm.type = $scope.locations[i].type;
                            $scope.locationForm.phone = $scope.locations[i].phone;
                            $scope.locationForm.province = parseInt($scope.locations[i].province);
                            $scope.locationForm.district = parseInt($scope.locations[i].district);
                            $scope.locationForm.ward = parseInt($scope.locations[i].ward);
                            $scope.updateLocation();

                            // Sử dụng $timeout để áp dụng các thay đổi vào giao diện sau khi chu kỳ $digest kết thúc.
                            $timeout(function () {
                                document.getElementById("inputAddress").value = cutStringToRetainAddress($scope.locationForm.address);
                            });

                            break;
                        }
                    }
                }
            } else {
                document.getElementById("addressDefaultModal").disabled = false;
            }

            // Thêm sự kiện click
            document.getElementById('changeAddress').addEventListener('click', clickHandlerEdit);
        }

        // Thêm sự kiện "hidden.bs.modal" để xóa sự kiện click khi modal đóng
        $('#address-modal').on('hidden.bs.modal', function () {
            document.getElementById('changeAddress').removeEventListener('click', clickHandlerAdd);
            document.getElementById('changeAddress').removeEventListener('click', clickHandlerEdit);
        });
    };

    function cutStringToRetainAddress(inputString) {
        // Tìm vị trí của dấu phẩy thứ 4 tính từ cuối
        var lastIndex = inputString.lastIndexOf(',');

        if (lastIndex !== -1) {
            // Tìm vị trí của dấu phẩy thứ 3 tính từ cuối
            var thirdLastIndex = inputString.lastIndexOf(',', lastIndex - 1);

            if (thirdLastIndex !== -1) {
                // Tìm vị trí của dấu phẩy thứ 2 tính từ cuối
                var secondLastIndex = inputString.lastIndexOf(',', thirdLastIndex - 1);

                if (secondLastIndex !== -1) {
                    // Cắt chuỗi từ đầu đến vị trí của dấu phẩy thứ 2
                    var result = inputString.substring(0, secondLastIndex);
                    return result;
                }
            }
        }

        // Trả về chuỗi gốc nếu không tìm thấy đủ 4 dấu phẩy
        return inputString;
    }

    $scope.clearModal = function () {
        $scope.selectedProvince = true;
        $scope.selectedDistrict = false;
        $scope.selectedWard = false;

        $scope.locationForm = {};

        $scope.locationForm.addressDefault = null;
        $scope.locationForm.address = null;
        $scope.locationForm.type = null;
        $scope.locationForm.phone = null;
    }

    $scope.openModalOrder = function (event, orderId) {
        $scope.changeTab(event, "order");

        $('#order-modal').modal('show');
        if (orderId) {
            OrderService.getById(orderId).then(function (order) {
                $scope.order = order.data;
                if ($scope.order) {
                    OrderDetailService.getByOrderDataId($scope.order.id).then(function (orderDetail) {
                        $scope.orderDetails = orderDetail.data;
                    }).catch(function (error) {
                        console.error('Lỗi khi lấy orderDetail:', error);
                    });
                }
            }).catch(function (error) {
                console.error('Lỗi khi lấy order:', error);
            });
        }
    };

    /*----END MODAL----*/

    /*----CHIA TRANG----*/
    // Page Order
    $scope.itemsPerPage = 6; // Số lượng phần tử hiển thị trên mỗi trang
    $scope.currentPage = 1; // Trang hiện tại
    $scope.totalPages = 0;
    $scope.displayedItems = [];
    $scope.getListOrderOnPage = function () {
        // Tổng số trang
        $scope.totalPages = PageService.calctotalPage($scope.itemsPerPage, $scope.orders);

        // Lấy danh sách sản phẩm cho trang hiện tại
        $scope.displayedItems = PageService.getDisplayedItems($scope.itemsPerPage, $scope.currentPage, $scope.orders);

        // Danh sách số trang hiển thị
        $scope.getPageRange = function (totalPages) {
            const maxPages = 10; // Số trang tối đa hiển thị liên tiếp
            const currentPage = $scope.currentPage;

            if (totalPages <= maxPages) {
                return Array(totalPages).fill().map((_, index) => index + 1);
            } else {
                let pageRange = [];
                if (currentPage <= 3) {
                    pageRange = Array(5).fill().map((_, index) => index + 1);
                    pageRange.push('...');
                    pageRange.push(totalPages);
                } else if (currentPage >= totalPages - 2) {
                    pageRange.push(1);
                    pageRange.push('...');
                    pageRange = pageRange.concat(Array(5).fill().map((_, index) => totalPages - 4 + index));
                } else {
                    pageRange.push(1);
                    pageRange.push('...');
                    pageRange = pageRange.concat(Array(3).fill().map((_, index) => currentPage - 1 + index));
                    pageRange.push('...');
                    pageRange.push(totalPages);
                }
                return pageRange;
            }
        };

    };

    $scope.previousPage = function () {
        if ($scope.currentPage > 1) {
            $scope.currentPage--;
        } else {
            $scope.currentPage = $scope.totalPages;
        }
        $scope.getListOrderOnPage();
    };

    $scope.nextPage = function () {
        if ($scope.currentPage < $scope.totalPages) {
            $scope.currentPage++;
        } else {
            $scope.currentPage = 1;
        }
        $scope.getListOrderOnPage();
    };

    $scope.get_ByPage = function (page) {
        $scope.currentPage = page;
        $scope.getListOrderOnPage();
    };

    // Page coupon
    $scope.itemsPerPageCoupon = 6; // Số lượng phần tử hiển thị trên mỗi trang
    $scope.currentPageCoupon = 1; // Trang hiện tại
    $scope.totalPageCoupons = 0;
    $scope.displayedItemCoupons = [];
    $scope.getListCouponOnPage = function () {
        // Tổng số trang
        $scope.totalPageCoupons = PageService.calctotalPage($scope.itemsPerPageCoupon, $scope.coupons);

        // Lấy danh sách sản phẩm cho trang hiện tại
        $scope.displayedItemCoupons = PageService.getDisplayedItems($scope.itemsPerPageCoupon, $scope.currentPageCoupon, $scope.coupons);

        // Danh sách số trang hiển thị
        $scope.getPageRangeCoupon = function (totalPages) {
            const maxPages = 10; // Số trang tối đa hiển thị liên tiếp
            const currentPage = $scope.currentPageCoupon;

            if (totalPages <= maxPages) {
                return Array(totalPages).fill().map((_, index) => index + 1);
            } else {
                let pageRange = [];
                if (currentPage <= 3) {
                    pageRange = Array(5).fill().map((_, index) => index + 1);
                    pageRange.push('...');
                    pageRange.push(totalPages);
                } else if (currentPage >= totalPages - 2) {
                    pageRange.push(1);
                    pageRange.push('...');
                    pageRange = pageRange.concat(Array(5).fill().map((_, index) => totalPages - 4 + index));
                } else {
                    pageRange.push(1);
                    pageRange.push('...');
                    pageRange = pageRange.concat(Array(3).fill().map((_, index) => currentPage - 1 + index));
                    pageRange.push('...');
                    pageRange.push(totalPages);
                }
                return pageRange;
            }
        };

    };

    $scope.previousPageCoupon = function () {
        if ($scope.currentPageCoupon > 1) {
            $scope.currentPageCoupon--;
        } else {
            $scope.currentPageCoupon = $scope.totalPageCoupons;
        }
        $scope.getListCouponOnPage();
    };

    $scope.nextPageCoupon = function () {
        if ($scope.currentPageCoupon < $scope.totalPageCoupons) {
            $scope.currentPageCoupon++;
        } else {
            $scope.currentPageCoupon = 1;
        }
        $scope.getListCouponOnPage();
    };

    $scope.get_ByPageCoupon = function (page) {
        $scope.currentPageCoupon = page;
        $scope.getListCouponOnPage();
    };

    /*----END CHIA TRANG----*/

    /*----API LOCATION---*/
    // API Location
    $scope.getLocation = function (api, scopeVariable) {
        $http.get(api)
            .then(function (response) {
                angular.copy(response.data, scopeVariable);
            })
    };

    $scope.callApiGetAll = function (api) {
        $http.get(api)
            .then(function (response) {
                $scope.provinces = response.data;
            }).catch(function (error) { });
    };

    $scope.callApiGetAll(hostLocation + "?depth=1");

    $scope.callApiDistrict = function (api) {
        $http.get(api)
            .then(function (response) {
                $scope.districts = response.data.districts;
            }).catch(function (error) { });;
    };

    $scope.callApiWard = function (api) {
        $http.get(api)
            .then(function (response) {
                $scope.wards = response.data.wards;
            }).catch(function (error) { });;
    };

    $scope.updateProvince = function () {
        provinceId = $scope.locationForm.province;
        // Gọi hàm để lấy dữ liệu quận/huyện của thành phố đã chọn
        $scope.callApiDistrict(hostLocation + "p/" + provinceId + "?depth=2");
        printResult();
        $scope.selectedDistrict = true;
        $scope.selectedWard = false;
        $scope.locationForm.district = null;
        $scope.locationForm.ward = null;
    };

    $scope.updateDistrict = function () {
        districtId = $scope.locationForm.district
        // Gọi hàm để lấy dữ liệu Xã/Phường của quận/huyện đã chọn
        $scope.callApiWard(hostLocation + "d/" + districtId + "?depth=2");
        printResult();
        $scope.selectedWard = true;
    };

    $scope.updateWard = function () {
        wardId = $scope.locationForm.ward
        printResult();
    };

    $scope.updateLocation = function () {
        $scope.selectedDistrict = true;
        $scope.selectedWard = true;

        // Gọi API để lấy danh sách tỉnh/thành phố
        $scope.callApiGetAll(hostLocation);
        // Gọi API để lấy danh sách quận/huyện
        $scope.getLocation(hostLocation + "d/", $scope.districts);
        // Gọi API để lấy danh sách xã/phường
        $scope.getLocation(hostLocation + "w/", $scope.wards);
    }

    var printResult = () => {
        if (provinceId != "" && districtId != "" && wardId != "") {
            let result = $("#ward option:selected").text() + ", " + $("#district option:selected").text() + ", " + $("#province option:selected").text();
            $scope.selectedLocation = result;
        }
    }
    /*----END API LOCATION---*/

}).filter('vndFormat', function () {
    // Filter định dạng tiền tệ
    return function (input) {
        if (!input) return '';
        var number = parseFloat(input);
        if (isNaN(number)) return input;
        var formattedNumber = number.toLocaleString('vi-VN');
        formattedNumber += ' VND';
        return formattedNumber;
    };
}).filter('dateFormat', function () {
    // Filter định dạng ngày tháng năm
    return function (dateString) {
        var date = new Date(dateString);
        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();
        day = (day < 10) ? '0' + day : day;
        month = (month < 10) ? '0' + month : month;
        var formattedDate = day + '/' + month + '/' + year;
        return formattedDate;
    };
});