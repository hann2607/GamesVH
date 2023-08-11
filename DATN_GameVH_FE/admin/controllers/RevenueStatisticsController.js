app.controller("RevenueStatisticsController", RevenueStatisticsController);

function RevenueStatisticsController($scope, ToastService, RevenueStatisticsService) {
    // Code chuyển tab
    $scope.activeTab = 1;

    $scope.changeTab = function (tabIndex) {
        $scope.activeTab = tabIndex;
    };

    // Code lấy 5 năm gần nhất
    function getPastFiveYears() {
        const currentYear = new Date().getFullYear();
        const pastFiveYears = [];

        for (let i = 0; i < 5; i++) {
            pastFiveYears.push(currentYear - i);
        }

        return pastFiveYears;
    }

    $scope.fiveYears = getPastFiveYears();

    // Code lấy các tháng trong năm hiện tại
    function getCurrentYearMonths() {
        const currentDate = new Date();
        const currentYear = currentDate.getFullYear();
        const currentMonth = currentDate.getMonth();
        const vietnameseMonths = [
            'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6',
            'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'
        ];
        const months = [];

        for (let month = 0; month <= currentMonth; month++) {
            months.push({ index: month + 1, name: vietnameseMonths[month] });
        }

        return months;
    }

    $scope.currentYearMonths = getCurrentYearMonths();

    // Thống kê theo tháng
    $scope.revenueByMonth = function () {
        var selectedTypeRevenueElement = document.getElementById("revenueByType");
        var selectedTypeRevenueValue = selectedTypeRevenueElement.value;
        var selectedMonthRevenueElement = document.getElementById("revenueByMonth");
        var selectedMonthRevenueValue = selectedMonthRevenueElement.value;
        var revenueTitle = document.getElementById("revenueMonthTitle");

        var revenueBarMonth = document.getElementById("donutRevenueByMonthAndCate");
        var revenueDonutMonth = document.getElementById("donutRevenueByMonthAndPaymentMethod");

        if (selectedTypeRevenueValue == "category" && selectedMonthRevenueValue) {
            // Check nếu người dùng chọn thống kê theo loại sản phẩm
            RevenueStatisticsService.getRevenueByMonthAndCategory(parseInt(selectedMonthRevenueValue))
                .then((response) => {
                    var dataResult = response.data;
                    var chartData = [];
                    if (dataResult) {
                        if (dataResult.length == 0) {
                            ToastService.showErrorToast("Tháng " + selectedMonthRevenueValue + " không có dữ liệu để thống kê!");
                        } else {
                            // Hiển thị biểu đồ
                            revenueBarMonth.removeAttribute("hidden");
                            revenueDonutMonth.setAttribute("hidden", true);
                            revenueBarMonth.innerHTML = "";
                            revenueTitle.removeAttribute("hidden");
                            $scope.type = "TRONG THÁNG " + selectedMonthRevenueValue + " NĂM " + $scope.fiveYears[0];

                            // Tạo data cho biểu đồ cột x ngang y dọc
                            dataResult.forEach(function (item) {
                                var chartJson = {
                                    x: item[1],
                                    y: item[2]
                                }

                                chartData.push(chartJson);
                            });

                            // Vẽ biểu đồ cột
                            Morris.Bar({
                                element: 'donutRevenueByMonthAndCate',
                                data: chartData,
                                xkey: 'x',
                                ykeys: ['y'],
                                labels: ['Tổng số đơn hàng']
                            })
                        }
                    } else {
                        ToastService.showErrorToast("Tháng " + selectedMonthRevenueValue + " không có dữ liệu để thống kê!");
                    }
                })
                .catch((err) =>
                    console.log("Lỗi khi lấy thống kê theo tháng!")
                );
        } else if (selectedTypeRevenueValue == "paymentType" && selectedMonthRevenueValue) {
            // Check nếu người dùng chọn thống kê theo phương thức thanh toán
            RevenueStatisticsService.getRevenueByMonthAndPaymentType(parseInt(selectedMonthRevenueValue))
                .then((response) => {
                    var dataResult = response.data;
                    var chartData = [];
                    if (dataResult) {
                        if (dataResult.length == 0) {
                            ToastService.showErrorToast("Tháng " + selectedMonthRevenueValue + " không có dữ liệu để thống kê!");
                        } else {
                            // hiển thị chart
                            revenueDonutMonth.removeAttribute("hidden");
                            revenueBarMonth.setAttribute("hidden", true);
                            revenueDonutMonth.innerHTML = "";
                            revenueTitle.removeAttribute("hidden");
                            $scope.type = "TRONG THÁNG " + selectedMonthRevenueValue + " NĂM " + $scope.fiveYears[0];

                            // Tính toán % cho biểu đồ tròn
                            var total = dataResult[0][1] + dataResult[0][2] + dataResult[0][3] + dataResult[0][4];
                            var momoPercent = Math.floor((dataResult[0][1] / total) * 100);
                            var vnpayPercent = Math.floor((dataResult[0][2] / total) * 100);
                            var paypalPercent = Math.floor((dataResult[0][3] / total) * 100);
                            var codPercent = Math.floor((dataResult[0][4] / total) * 100);

                            // Vẽ biểu đồ tròn
                            Morris.Donut({
                                element: 'donutRevenueByMonthAndPaymentMethod',
                                data: [
                                    { value: momoPercent, label: 'MOMO', formatted: 'Xấp xỉ ' + momoPercent + '%' },
                                    { value: vnpayPercent, label: 'VNPAY', formatted: 'Xấp xỉ ' + vnpayPercent + '%' },
                                    { value: paypalPercent, label: 'PAYPAL', formatted: 'Xấp xỉ ' + paypalPercent + '%' },
                                    { value: codPercent, label: 'COD', formatted: 'Xấp xỉ ' + codPercent + '%' }
                                ],
                                formatter: function (x, data) { return data.formatted; }
                            });
                        }
                    } else {
                        ToastService.showErrorToast("Tháng " + selectedMonthRevenueValue + " không có dữ liệu để thống kê!");
                    }
                })
                .catch((err) =>
                    console.log("Lỗi khi lấy thống kê theo tháng!")
                );
        } else {
            if (!selectedMonthRevenueValue) {
                ToastService.showErrorToast("Vui lòng chọn tháng!");
            } else {
                ToastService.showErrorToast("Vui lòng chọn loại thống kê!");
            }

        }
    }

    // Thống kê theo năm
    $scope.revenueByYear = function () {
        var selectedYearRevenueElement = document.getElementById("revenueByYear");
        var selectedYearRevenueValue = selectedYearRevenueElement.value;
        var selectedTypeRevenueElement = document.getElementById("revenueByYearType");
        var selectedTypeRevenueValue = selectedTypeRevenueElement.value;
        var revenueTitle = document.getElementById("revenueYearTitle");

        var revenueBarYear = document.getElementById("barRevenueByYear");
        var revenueLineYear = document.getElementById("lineRevenueByYearForTotalPrice");

        if (selectedYearRevenueValue && selectedTypeRevenueValue) {
            if (selectedTypeRevenueValue == "order") {
                RevenueStatisticsService.getRevenueByYear(parseInt(selectedYearRevenueValue))
                    .then((response) => {
                        var dataResult = response.data;
                        var chartData = [];
                        if (dataResult) {
                            if (dataResult.length == 0) {
                                ToastService.showErrorToast("Năm " + selectedYearRevenueValue + " không có dữ liệu để thống kê!");
                            } else {
                                // Hiển thị biểu đồ
                                revenueBarYear.removeAttribute("hidden");
                                revenueTitle.removeAttribute("hidden");
                                revenueLineYear.setAttribute("hidden", true);
                                $scope.year = selectedYearRevenueValue;
                                revenueBarYear.innerHTML = "";

                                dataResult.sort(function (a, b) {
                                    return a[0] - b[0]; // So sánh và trả về kết quả để sắp xếp tăng dần
                                });

                                // Tạo data cho biểu đồ
                                dataResult.forEach(function (item) {
                                    var chartJson = {
                                        x: 'Tháng ' + item[0],
                                        y: item[1],
                                        z: item[2]
                                    }
                                    chartData.push(chartJson);
                                });

                                // Vẽ biểu đồ
                                Morris.Bar({
                                    element: 'barRevenueByYear',
                                    data: chartData,
                                    xkey: 'x',
                                    ykeys: ['y', 'z'],
                                    labels: ['Số đơn hàng đã hoàn thành', 'Số đơn hàng đã hủy']
                                })
                            }
                        } else {
                            ToastService.showErrorToast("Năm " + selectedYearRevenueValue + " không có dữ liệu để thống kê!");
                        }
                    })
                    .catch((err) =>
                        console.log("Lỗi khi lấy thống kê theo năm!")
                    );
            } else {
                RevenueStatisticsService.getRevenueByTotalPriceForYear(parseInt(selectedYearRevenueValue))
                    .then((response) => {
                        var dataResult = response.data;
                        var chartData = [];
                        if (dataResult) {
                            if (dataResult.length == 0) {
                                ToastService.showErrorToast("Năm " + selectedYearRevenueValue + " không có dữ liệu để thống kê!");
                            } else {
                                // Hiển thị biểu đồ
                                revenueLineYear.removeAttribute("hidden");
                                revenueTitle.removeAttribute("hidden");
                                revenueBarYear.setAttribute("hidden", true);
                                $scope.year = selectedYearRevenueValue;
                                revenueLineYear.innerHTML = "";

                                dataResult.sort(function (a, b) {
                                    return a[0] - b[0]; // So sánh và trả về kết quả để sắp xếp tăng dần
                                });

                                // Tạo data cho biểu đồ
                                dataResult.forEach(function (item) {
                                    var chartJson = {
                                        "period": selectedYearRevenueValue + '-' + item[0],
                                        "totalPrice": item[1]
                                    }
                                    chartData.push(chartJson);
                                });

                                // Vẽ biểu đồ
                                Morris.Line({
                                    element: 'lineRevenueByYearForTotalPrice',
                                    data: chartData,
                                    xkey: 'period',
                                    ykeys: ['totalPrice'],
                                    labels: ['Tổng doanh thu'],
                                    smooth: false
                                });
                            }
                        } else {
                            ToastService.showErrorToast("Năm " + selectedYearRevenueValue + " không có dữ liệu để thống kê!");
                        }
                    })
                    .catch((err) =>
                        console.log("Lỗi khi lấy thống kê theo năm!")
                    );
            }

        } else {
            if (!selectedYearRevenueValue) {
                ToastService.showErrorToast("Vui lòng chọn năm!");
            } else {
                if (!selectedTypeRevenueValue) {
                    ToastService.showErrorToast("Vui lòng chọn loại thống kê!");
                }
            }
        }
    }
}